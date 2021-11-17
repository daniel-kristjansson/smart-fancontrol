from smartfancontrol.features.sensors import read_sensors, flatten_sensors
from smartfancontrol.features.cpuinfo import read_cpuinfo, flatten_cpuinfo
from smartfancontrol.features.stat import read_stat, flatten_stat
from smartfancontrol.features.profile import read_profile, flatten_profile
from smartfancontrol.features.power import read_power, flatten_power
import tensorflow as tf


def extract_features_list(t: tuple) -> list:
    return flatten_sensors(t[0]) + flatten_cpuinfo(t[1]) + flatten_stat(t[2]) \
           + flatten_profile(t[3]) + flatten_power(t[4])


def extract_features_tensor(t: tuple) -> dict:
    return {
        'sensors': tf.convert_to_tensor(flatten_sensors(t[0]), dtype=tf.float32),
        'cpuinfo': tf.convert_to_tensor(flatten_cpuinfo(t[1]), dtype=tf.float32),
        'stat': tf.convert_to_tensor(flatten_stat(t[2]), dtype=tf.float32),
        'profile': tf.convert_to_tensor(flatten_profile(t[3]), dtype=tf.float32),
        'power': tf.convert_to_tensor(flatten_power(t[4]), dtype=tf.float32),
    }


def read_features() -> tuple:
    return read_sensors(), read_cpuinfo(), read_stat(), read_profile(), read_power()
