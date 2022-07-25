from unittest import TestCase

from smartfancontrol.features.features import extract_features_v1_tensor_dict, extract_features_v2_tensor_dict, \
    extract_features_v3_tensor_dict, extract_features_v4_tensor_dict, summarize_features_v1_tensor, \
    summarize_features_v2_tensor, summarize_features_v3_tensor, summarize_features_v4_tensor
from tests.features.test_acpi import ACPI_INPUT
from tests.features.test_cpuinfo import CPUINFO_INPUT
from tests.features.test_lapmode import LAPMODE_INPUT
from tests.features.test_power import POWER_INPUT
from tests.features.test_sensors import SENSORS_INPUT
from tests.features.test_stat import STAT_INPUT
from tests.features.test_thermal import THERMAL_INPUT
from tests.features.test_usermode import USERMODE_INPUT

PROFILE_INPUT = {'platform_profile': 1}
FEATURES_V1_INPUT = (SENSORS_INPUT, CPUINFO_INPUT, STAT_INPUT, PROFILE_INPUT, POWER_INPUT)
FEATURES_V2_INPUT = (THERMAL_INPUT, CPUINFO_INPUT, POWER_INPUT, LAPMODE_INPUT)
FEATURES_V3_INPUT = (THERMAL_INPUT, CPUINFO_INPUT, POWER_INPUT, ACPI_INPUT)
FEATURES_V4_INPUT = (THERMAL_INPUT, CPUINFO_INPUT, POWER_INPUT, ACPI_INPUT, USERMODE_INPUT)


class TestFeatures(TestCase):
    def test_extract_features_v1_tensor(self):
        output = extract_features_v1_tensor_dict(FEATURES_V1_INPUT)
        print(output)

    def test_summarize_features_v1_tensor(self):
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

    def test_extract_features_v3_tensor(self):
        output = extract_features_v3_tensor_dict(FEATURES_V3_INPUT)
        print(output)

    def test_summarize_features_v3_tensor(self):
        output = extract_features_v3_tensor_dict(FEATURES_V3_INPUT)
        summary = summarize_features_v3_tensor(output)
        print(summary)

    def test_extract_features_v4_tensor(self):
        output = extract_features_v4_tensor_dict(FEATURES_V4_INPUT)
        print(output)

    def test_summarize_features_v4_tensor(self):
        output = extract_features_v4_tensor_dict(FEATURES_V4_INPUT)
        summary = summarize_features_v4_tensor(output)
        print(summary)
