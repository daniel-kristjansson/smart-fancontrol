import datetime
import time
import sched

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


def action(temp: float) -> int:
    level = 7
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
    return level


def adjust_wattage(profile: int) -> (int, int):
    if profile == 0:
        return 12, 24
    elif profile == 1:
        return 20, 35
    else:
        return 28, 44


def collect_features_and_execute_once():
    all_features = read_features()
    level = action(extract_core_cur_temp(all_features[0]))
    log(extract_features(all_features), str(level))
    set_fan_level(level)
    set_wattage(adjust_wattage(2 if level < 2 else 1 if level < 3 else 0))


def main():
    # revs = [0.0, 2259.0, 2785.0, 2898.0, 3024.0, 3926.0, 4285.0, 4300.0]
    interval = 0.2 # seconds between runs
    while True:
        start = time.time()
        collect_features_and_execute_once()
        left = interval - (time.time() - start)
        if left > 0:
            time.sleep(left)
