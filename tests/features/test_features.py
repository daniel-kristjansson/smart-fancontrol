from unittest import TestCase

from smartfancontrol.features import summarize_features_tensor, extract_features_tensor
from tests.features.test_cpuinfo import CPUINFO_INPUT
from tests.features.test_power import POWER_INPUT
from tests.features.test_sensors import SENSORS_INPUT
from tests.features.test_stat import STAT_INPUT

PROFILE_INPUT = {'platform_profile': 1}
FEATURES_INPUT = (SENSORS_INPUT, CPUINFO_INPUT, STAT_INPUT, PROFILE_INPUT, POWER_INPUT)


class TestFeatures(TestCase):
    def test_extract_features_tensor(self):
        output = extract_features_tensor(FEATURES_INPUT)
        print(output)

    def test_summarize_features_tensor(self):
        output = extract_features_tensor(FEATURES_INPUT)
        summary = summarize_features_tensor(output)
        print(summary)
