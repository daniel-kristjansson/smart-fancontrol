from smartfancontrol.features.sensors import read_sensors, flatten_sensors
from smartfancontrol.features.cpuinfo import read_cpuinfo, flatten_cpuinfo
from smartfancontrol.features.stat import read_stat, flatten_stat
from smartfancontrol.features.profile import read_profile, flatten_profile
from smartfancontrol.features.power import read_power, flatten_power


def extract_features(t: tuple) -> list:
    return flatten_sensors(t[0]) + flatten_cpuinfo(t[1]) + flatten_stat(t[2])\
           + flatten_profile(t[3]) + flatten_power(t[4])


def read_features() -> tuple:
    return read_sensors(), read_cpuinfo(), read_stat(), read_profile(), read_power()
