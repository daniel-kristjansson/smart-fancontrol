from unittest import TestCase

from smartfancontrol.features import extract_features_list
from tests.features.test_power import POWER_INPUT
from tests.features.test_sensors import SENSORS_INPUT

CPUINFO_INPUT = {"cpu0_mhz": 1093.991, "cpu1_mhz": 2800.0}
STAT_INPUT = {'cpu_user': 0.075, 'cpu_nice': 0.0, 'cpu_system': 0.025, 'cpu_idle': 0.9}
PROFILE_INPUT = {'platform_profile': 1}


class TestFeatures(TestCase):
    def test_extract_features(self):
        output = extract_features_list((SENSORS_INPUT, CPUINFO_INPUT, STAT_INPUT, PROFILE_INPUT, POWER_INPUT))
        self.assertIsInstance(output, list)
        print(output)
        self.assertGreaterEqual(len(output), 17)
