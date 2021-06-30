import subprocess
import json
import time
import atexit
import datetime

def read():
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

def extract_features(s: dict) -> list:
    return [extract_fan_speed(s), extract_core_cur_temp(s), extract_cpu_cur_temp(s)]
