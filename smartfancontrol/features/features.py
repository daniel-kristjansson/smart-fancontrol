from smartfancontrol.features.sensors import read_sensors, flatten_sensors
from smartfancontrol.features.cpuinfo import read_cpuinfo, flatten_cpuinfo
from smartfancontrol.features.stat import read_stat, flatten_stat


def extract_features(t: tuple) -> list:
    return flatten_sensors(t[0]) + flatten_cpuinfo(t[1]) + flatten_stat(t[2])


def read_features() -> tuple:
    return read_sensors(), read_cpuinfo(), read_stat()
