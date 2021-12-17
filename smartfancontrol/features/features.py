from collections import ChainMap

import tensorflow as tf

from smartfancontrol.features.cpuinfo import read_cpuinfo, extract_cpuinfo_tensor
from smartfancontrol.features.power import read_power, extract_power_tensor
from smartfancontrol.features.profile import read_profile, extract_profile_tensor
from smartfancontrol.features.sensors import read_sensors, extract_sensors_tensor
from smartfancontrol.features.stat import read_stat, extract_stat_tensor
from smartfancontrol.features.thermal import extract_thermal_tensor, read_thermal


def extract_features_v1_tensor_dict(t: tuple) -> dict:
    return ChainMap(extract_cpuinfo_tensor(t[1]), extract_stat_tensor(t[2]), extract_profile_tensor(
        t[3]), extract_power_tensor(t[4]), extract_sensors_tensor(t[0]))


def extract_features_v2_tensor_dict(t: tuple) -> dict:
    return ChainMap(extract_thermal_tensor(t[0]), extract_cpuinfo_tensor(t[1]), extract_power_tensor(t[2]))


def summarize_features_v1_tensor(t: dict[str, tf.Tensor]) -> str:
    temp = 'temp {:4.1f} {:4.1f} {:4.1f}'.format(
        tf.math.reduce_min(t['temp']),
        tf.math.reduce_mean(t['temp']),
        tf.math.reduce_max(t['temp']))
    fan = 'fan {:4.0f}'.format(t['fan_rpm'][0])
    cpu_speed = 'cpu {:4.0f}'.format(tf.math.reduce_mean(t['cpuinfo']))
    cpu_idle = 'idle {:3.0f}%'.format(t['cpu_idle'][0] * 100)
    cur_power = 'power {:5.2f}'.format(t['power'][0])
    power_c = 'pc {:2.0f} {:2.0f}'.format(t['power_constraints'][0], t['power_constraints'][1])
    return ' '.join([temp, fan, cpu_speed, cpu_idle, cur_power, power_c])


def summarize_features_v2_tensor(t: dict[str, tf.Tensor]) -> str:
    temp = 'temp {:4.1f}'.format(tf.math.reduce_mean(t['temp']))
    cpu_speed = 'cpu {:4.0f}'.format(tf.math.reduce_mean(t['cpuinfo']))
    cur_power = 'power {:5.2f}'.format(t['power'][0])
    return ' '.join([temp, cpu_speed, cur_power])


def read_features_v1() -> tuple:
    return read_sensors(), read_cpuinfo(), read_stat(), read_profile(), read_power()


def read_features_v2() -> tuple:
    return read_thermal(), read_cpuinfo(), read_power()
