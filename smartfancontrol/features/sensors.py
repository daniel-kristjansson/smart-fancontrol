import subprocess
import json
from collections import Iterator
from itertools import chain


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


def unpack_any(val) -> Iterator:
    if isinstance(val, dict):
        return unpack_dict(val)
    elif isinstance(val, list):
        return unpack_list(val)
    else:
        return iter(())


def unpack_list(lst: list) -> Iterator:
    return chain.from_iterable([unpack_any(val) for val in lst])


def unpack_dict(d: dict) -> list:
    output = []
    for key in sorted(d.keys()):
        val = d[key]
        output += unpack_any(val)
        if "temp" in key and "input" in key:
            output.append(val)
        if "fan" in key and "input" in key:
            output.append(val)
    return output


def flatten_sensors(d: dict) -> list:
    return unpack_dict(d)
