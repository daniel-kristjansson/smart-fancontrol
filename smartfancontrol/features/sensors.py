import subprocess
import json
from collections import Iterator
from itertools import chain
import re
import tensorflow as tf

TEMP_MATCHER = re.compile(r'temp(\d+)_input')
FAN_MATCHER = re.compile(r'fan(\d+)_input')
TEMP_AND_FAN_MATCHER = re.compile(r'temp(\d+)_input|fan(\d+)_input')


def read_sensors() -> dict:
    process = subprocess.Popen(["sensors", "-j"],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return json.loads(stdout)


def extract_cpu_cur_temp(sensor_json: dict) -> float:
    return sensor_json['thinkpad-isa-0000']['CPU']['temp1_input']


def extract_core_cur_temp(sensor_json: dict) -> float:
    return sensor_json['coretemp-isa-0000']['Package id 0']['temp1_input']


def extract_core_max_temp(sensor_json: dict) -> float:
    return sensor_json['coretemp-isa-0000']['Package id 0']['temp1_max']


def extract_fan_speed(sensor_json: dict) -> float:
    return sensor_json['thinkpad-isa-0000']['Fan1']['fan1_input']


def unpack_any(val, matcher) -> Iterator:
    if isinstance(val, dict):
        return unpack_dict(val, matcher)
    elif isinstance(val, list):
        return unpack_list(val, matcher)
    else:
        return iter(())


def unpack_list(lst: list, matcher) -> Iterator:
    return chain.from_iterable([unpack_any(val, matcher) for val in lst])


def unpack_dict(d: dict, matcher) -> list:
    output = []
    for key in sorted(d.keys()):
        val = d[key]
        output += unpack_any(val, matcher)
        if matcher.match(key):
            output.append(val)
    return output


def unpack_any_names(val, prepend: str, matcher) -> Iterator:
    if isinstance(val, dict):
        return unpack_dict_names(val, prepend, matcher)
    elif isinstance(val, list):
        return unpack_list_names(val, prepend, matcher)
    else:
        return iter(())


def unpack_list_names(lst: list, prepend: str, matcher) -> Iterator:
    return chain.from_iterable([unpack_any_names(val, prepend, matcher) for val in lst])


def unpack_dict_names(d: dict, prepend: str, matcher) -> list:
    output = []
    for key in sorted(d.keys()):
        val = d[key]
        output += unpack_any_names(val, key + ".", matcher)
        if matcher.match(key):
            output.append(prepend + key)
    return output


def flatten_sensors(d: dict) -> list:
    return unpack_dict(d, TEMP_AND_FAN_MATCHER)


def extract_sensors_tensor_names(d: dict) -> list:
    return {
        "temp": unpack_dict_names(d, "", TEMP_MATCHER),
        "fan_rpm": unpack_dict_names(d, "", FAN_MATCHER)
    }


def extract_sensors_tensor(d: dict) -> dict:
    return {
        "temp": tf.convert_to_tensor(unpack_dict(d, TEMP_MATCHER), dtype=tf.float32),
        "fan_rpm": tf.convert_to_tensor(unpack_dict(d, FAN_MATCHER), dtype=tf.float32)
    }
