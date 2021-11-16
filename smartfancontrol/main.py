import time
import datetime
from smartfancontrol.features import read_features, extract_features
from smartfancontrol.features.sensors import extract_core_cur_temp
from smartfancontrol.controller import set_fan_level, set_wattage

import sys
import math
import pandas as pd
import tensorflow as tf
from tf_agents.environments import utils, tf_py_environment
import tf_agents.policies


def log(features: list, label: str):
    print(str(datetime.datetime.utcnow()) + " " + " ".join([str(i) for i in features]) + " " + label)


def adjust_fan_level(temp: float, level: int, z: int) -> (int, int):
    if temp < 40:
        level = 0
        z = -1
    elif temp < 49:
        level = 1
        z = -1
    elif temp < 60:
        level = 2
        z = -1
    elif temp < 70:
        level = 3
        z = -1
    elif temp < 80:
        level = 5
        z = -1
    elif temp > 90:
        level = 7
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


def action(step) -> int:
    if temp < 40:
        level = 0
    elif temp < 49:
        level = 1
    elif temp < 60:
        level = 2
    elif temp < 70:
        level = 3
    elif temp < 80:
        level = 5
    elif temp > 90:
        level = 7
    return level


def adjust_wattage(profile: int) -> (int, int):
    if profile == 0:
        return 12, 24
    elif profile == 1:
        return 20, 35
    else:
        return 28, 44


def main():
    # revs = [0.0, 2259.0, 2785.0, 2898.0, 3024.0, 3926.0, 4285.0, 4300.0]
    level = -1
    z = -1
    z2 = -1
    while True:
        all_features = read_features()
        # only fan adjust every 2 seconds
        if (z2 < 0):
            (level, z) = adjust_fan_level(extract_core_cur_temp(all_features[0]), level, z)
            set_fan_level(level)
            wattage = adjust_wattage(all_features[-1])
            set_wattage(wattage[0], wattage[1])
            z2 = 20
        else:
            z2 -= 1
        log(extract_features(all_features), str(level))
        time.sleep(0.1)
