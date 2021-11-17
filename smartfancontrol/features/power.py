import datetime
import time
import os
import re

import numpy
import numpy as np

OLD_SAMPLE = ()
CONSTRAINT_MATCHER = re.compile(r'constraint_(\d+)_power_limit_uw')
ENERGY_MATCHER = re.compile(r'energy_uj')


def has_name(root: str, f_names: list[str], name: str) -> bool:
    if "name" in f_names:
        with open(os.path.join(root, "name")) as file:
            return file.read().strip() == name
    return False


def build_energy_map(base: str) -> dict:
    for root, d_names, f_names in os.walk(base):
        if has_name(root, f_names, "package-0"):
            return {key: os.path.join(root, key) for key in f_names
                    if ENERGY_MATCHER.match(key)}


def extract_constraint_name(root: str, index: str):
    if index:
        with open(os.path.join(root, "constraint_" + index + "_name")) as file:
            return file.read().strip()
    return None


def build_constraint_map(base: str) -> dict:
    for root, d_names, f_names in os.walk(base):
        if has_name(root, f_names, "package-0"):
            d = {}
            for key in f_names:
                match = CONSTRAINT_MATCHER.match(key)
                if match:
                    name = extract_constraint_name(root, match.group(1))
                    if name:
                        d[name] = os.path.join(root, key)
            return d


def build_maps():
    maps = build_energy_map("/sys/devices/virtual/powercap/intel-rapl-mmio")
    maps |= build_constraint_map("/sys/devices/virtual/powercap/intel-rapl-mmio")
    if len(maps.keys()) == 0:
        maps = build_energy_map("/sys/devices/virtual/powercap/intel-rapl")
        maps |= build_constraint_map("/sys/devices/virtual/powercap/intel-rapl")
    return maps


MAPS = build_maps()


def calc_stats(key: str, old_sample: numpy.ndarray, new_sample: numpy.ndarray) -> dict:
    diff = (new_sample - old_sample)
    total = np.sum(diff)
    values = diff / total
    prefix = key + "_"
    return {prefix + NAMES[i]: values[i] for i in range(0, len(NAMES))}


def sample_energy() -> tuple[datetime, int]:
    global MAPS
    with open(MAPS["energy_uj"], "r", 1) as file:
        return datetime.datetime.utcnow(), int(file.read().strip())


def grab_two_samples():
    global OLD_SAMPLE
    sample = sample_energy()
    if not OLD_SAMPLE:
        OLD_SAMPLE = sample
        time.sleep(0.1)
        sample = sample_energy()
    time_diff = sample[0] - OLD_SAMPLE[0]
    if time_diff.seconds != 0:
        OLD_SAMPLE = sample
        time.sleep(0.1)
        sample = sample_energy()
    return OLD_SAMPLE, sample


def read_current() -> dict:
    old_sample, new_sample = grab_two_samples()
    time_diff = (new_sample[0] - old_sample[0]).total_seconds()
    joules = (new_sample[1] - old_sample[1]) * 0.000001
    return {"watts": joules / time_diff}


def read_constraints() -> dict:
    global MAPS
    d = {}
    for key in MAPS.keys():
        if key != "energy_uj":
            with open(MAPS[key], "r", 1) as file:
                d[key] = int(file.read().strip()) * 0.000001
    return d


def read_power() -> dict:
    return read_current() | read_constraints()


def flatten_power(d: dict) -> list:
    return [d[key] for key in sorted(d.keys())]
