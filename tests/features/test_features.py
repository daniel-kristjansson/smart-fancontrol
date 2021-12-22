from unittest import TestCase

from smartfancontrol.features.features import extract_features_v1_tensor_dict, extract_features_v2_tensor_dict
from smartfancontrol.features.features import summarize_features_v1_tensor, summarize_features_v2_tensor
from tests.features.test_cpuinfo import CPUINFO_INPUT
from tests.features.test_lapmode import LAPMODE_INPUT
from tests.features.test_power import POWER_INPUT
from tests.features.test_sensors import SENSORS_INPUT
from tests.features.test_stat import STAT_INPUT
from tests.features.test_thermal import THERMAL_INPUT

PROFILE_INPUT = {'platform_profile': 1}
FEATURES_V1_INPUT = (SENSORS_INPUT, CPUINFO_INPUT, STAT_INPUT, PROFILE_INPUT, POWER_INPUT)
FEATURES_V2_INPUT = (THERMAL_INPUT, CPUINFO_INPUT, POWER_INPUT, LAPMODE_INPUT)


class TestFeatures(TestCase):
    def test_extract_features_tensor(self):
        output = extract_features_v1_tensor_dict(FEATURES_V1_INPUT)
        print(output)

    def test_summarize_features_tensor(self):
        output = extract_features_v1_tensor_dict(FEATURES_V1_INPUT)
        summary = summarize_features_v1_tensor(output)
        print(summary)

    def test_extract_features_v2_tensor(self):
        output = extract_features_v2_tensor_dict(FEATURES_V2_INPUT)
        print(output)

    def test_summarize_features_v2_tensor(self):
        output = extract_features_v2_tensor_dict(FEATURES_V2_INPUT)
        summary = summarize_features_v2_tensor(output)
        print(summary)
