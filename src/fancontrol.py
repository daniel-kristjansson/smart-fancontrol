#!/usr/bin/python

import subprocess
import json
import time
import atexit
import datetime

def sensors():
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

def send_fan(string: str):
    with open("/proc/acpi/ibm/fan","w",1) as file:
        file.write(string + "\n")

def set_fan_level(level: int):
    send_fan("level "+ str(level))

def set_fan_auto():
    send_fan("level auto")

@atexit.register
def leave():
    set_fan_auto()

def log(features: list, label: str):
    print(str(datetime.datetime.utcnow()) + " " +  " ".join([str(i) for i in features]) + " " + label)

def adjust_fan_level(temp: float, level: int, z: int) -> (int, int):
    if temp < 40:
        level = 0
        z = -1
    elif temp < 50:
        level = 2
        z = -1
    elif temp < 60:
        level = 3
        z = -1
    elif temp < 70:
        level = 3
        z = -1
    elif temp > 90:
        level = 4
        z = -1
    elif level < 0:
        level = 4
        z = -1
    elif z < 0:
        level = min(level + 1, 7)
        z = 5
    else:
        z -= 1
    return (level, z)

def extract_features(s: dict) -> list:
    return [extract_fan_speed(s), extract_core_cur_temp(s), extract_cpu_cur_temp(s)]

def main():
    revs=[0.0, 2259.0, 2785.0, 2898.0, 3024.0, 3926.0, 4285.0, 4300.0]
    level = -1
    z = -1
    z2 = -1
    while True:
        s = sensors()
        # only adjust every 2 seconds
        if (z2 < 0):
            (level, z) = adjust_fan_level(extract_core_cur_temp(s), level, z)
            set_fan_level(level)
            z2 = 20
        else:
            z2 -= 1
        log(extract_features(s), str(level))
        time.sleep(0.1)

if __name__ == "__main__":
    main()

