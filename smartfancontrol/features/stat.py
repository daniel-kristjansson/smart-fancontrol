import ast
import re
import datetime
import time
from typing import Pattern

import numpy
import numpy as np
import tensorflow as tf

PATTERN: Pattern[str] = re.compile(r"^(cpu\d*)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)")
OLD_SAMPLE = ()
NAMES = ["user", "nice", "system", "idle"]
IDLE_REGEX = re.compile(r"cpu\d+_idle")
USER_REGEX = re.compile(r"cpu\d+_user")
SYSTEM_REGEX = re.compile(r"cpu\d+_system")
NICE_REGEX = re.compile(r"cpu\d+_nice")


def regex_line(line: str):
    global PATTERN
    result = PATTERN.search(line)
    if result and result.lastindex >= 5:
        user = ast.literal_eval(result.group(2))
        nice = ast.literal_eval(result.group(3))
        system = ast.literal_eval(result.group(4))
        idle = ast.literal_eval(result.group(5))
        return result.group(1), np.array([user, nice, system, idle])
    return None


def calc_stats(key: str, old_sample: numpy.ndarray, new_sample: numpy.ndarray) -> dict:
    diff = (new_sample - old_sample)
    total = np.sum(diff)
    values = diff / total
    prefix = key + "_"
    return {prefix + NAMES[i]: values[i] for i in range(0, len(NAMES))}


def extract_values(lines: list) -> dict:
    lst = filter(lambda v: v, [regex_line(line) for line in lines])
    return {val[0]: val[1] for val in lst}


def sample_stat() -> tuple[datetime, dict]:
    with open("/proc/stat", "r", 1) as file:
        return datetime.datetime.utcnow(), extract_values(file.readlines())


def grab_two_samples() -> tuple[dict, dict]:
    global OLD_SAMPLE
    sample = sample_stat()
    if not OLD_SAMPLE:
        OLD_SAMPLE = sample
        time.sleep(0.1)
        sample = sample_stat()
    time_diff = sample[0] - OLD_SAMPLE[0]
    if time_diff.seconds != 0:
        OLD_SAMPLE = sample
        time.sleep(0.1)
        sample = sample_stat()
    return OLD_SAMPLE[1], sample[1]


def read_stat() -> dict:
    old_sample, new_sample = grab_two_samples()
    d = {}
    for key in old_sample.keys():
        d.update(calc_stats(key, old_sample[key], new_sample[key]))
    return d


def extract_stat_tensor(d: dict) -> dict:
    # This sorting results in a lexicographical order of cpus, which is likely confusing
    # with more than 9 cpus.
    sorted_keys = sorted(d.keys())
    return {
        "cpu_idle": tf.constant([d[key] for key in sorted_keys if IDLE_REGEX.match(key)], dtype=tf.float32),
        "cpu_user": tf.constant([d[key] for key in sorted_keys if USER_REGEX.match(key)], dtype=tf.float32),
        "cpu_system": tf.constant([d[key] for key in sorted_keys if SYSTEM_REGEX.match(key)], dtype=tf.float32),
        "cpu_nice": tf.constant([d[key] for key in sorted_keys if NICE_REGEX.match(key)], dtype=tf.float32),
    }
