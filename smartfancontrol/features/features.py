from smartfancontrol.features.sensors import read_sensors, flatten_sensors, extract_sensors_tensor
from smartfancontrol.features.cpuinfo import read_cpuinfo, flatten_cpuinfo
from smartfancontrol.features.stat import read_stat, flatten_stat, extract_stat_tensor
from smartfancontrol.features.profile import read_profile, flatten_profile
from smartfancontrol.features.power import read_power, flatten_power, extract_power_tensor
import tensorflow as tf


def extract_features_list(t: tuple) -> list:
    return flatten_sensors(t[0]) + flatten_cpuinfo(t[1]) + flatten_stat(t[2]) \
           + flatten_profile(t[3]) + flatten_power(t[4])


def extract_features_tensor_dict(t: tuple) -> dict:
    m = {
        'cpuinfo': tf.convert_to_tensor(flatten_cpuinfo(t[1]), dtype=tf.float32),
        'profile': tf.convert_to_tensor(flatten_profile(t[3]), dtype=tf.float32),
    }
    m |= extract_stat_tensor(t[2])
    m |= extract_power_tensor(t[4])
    m |= extract_sensors_tensor(t[0])
    return m


def summarize_features_tensor(t: dict[str, tf.Tensor]) -> str:
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


def read_features() -> tuple:
    return read_sensors(), read_cpuinfo(), read_stat(), read_profile(), read_power()
