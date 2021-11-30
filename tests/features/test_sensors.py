import json
from unittest import TestCase

import tensorflow as tf

from smartfancontrol.features import flatten_sensors
from smartfancontrol.features.sensors import extract_sensors_tensor, extract_sensors_tensor_names

SENSORS_INPUT = json.loads('''
{
  "ucsi_source_psy_USBC000:002-isa-0000": {
    "Adapter": "ISA adapter",
    "in0": {
      "in0_input": 5,
      "in0_min": 5,
      "in0_max": 20
    },
    "curr1": {
      "curr1_input": 3,
      "curr1_max": 2.45
    }
  },
  "iwlwifi_1-virtual-0": {
    "Adapter": "Virtual device",
    "temp1": {
      "temp1_input": 36
    }
  },
  "coretemp-isa-0000": {
    "Adapter": "ISA adapter",
    "Package id 0": {
      "temp1_input": 38,
      "temp1_max": 100,
      "temp1_crit": 100,
      "temp1_crit_alarm": 0
    },
    "Core 0": {
      "temp2_input": 33,
      "temp2_max": 100,
      "temp2_crit": 100,
      "temp2_crit_alarm": 0
    },
    "Core 1": {
      "temp3_input": 34,
      "temp3_max": 100,
      "temp3_crit": 100,
      "temp3_crit_alarm": 0
    },
    "Core 2": {
      "temp4_input": 34,
      "temp4_max": 100,
      "temp4_crit": 100,
      "temp4_crit_alarm": 0
    },
    "Core 3": {
      "temp5_input": 34,
      "temp5_max": 100,
      "temp5_crit": 100,
      "temp5_crit_alarm": 0
    }
  },
  "BAT0-acpi-0": {
    "Adapter": "ACPI interface",
    "in0": {
      "in0_input": 12.813
    }
  },
  "ucsi_source_psy_USBC000:001-isa-0000": {
    "Adapter": "ISA adapter",
    "in0": {
      "in0_input": 0,
      "in0_min": 0,
      "in0_max": 0
    },
    "curr1": {
      "curr1_input": 0,
      "curr1_max": 0
    }
  },
  "thinkpad-isa-0000": {
    "Adapter": "ISA adapter",
    "Fan1": {
      "fan1_input": 1986
    },
    "CPU": {
      "temp1_input": 39
    }
  },
  "nvme-pci-0400": {
    "Adapter": "PCI adapter",
    "Composite": {
      "temp1_input": 42.85,
      "temp1_max": 77.85,
      "temp1_min": -20.15,
      "temp1_crit": 81.85,
      "temp1_alarm": 0
    },
    "Sensor 1": {
      "temp2_input": 42.85,
      "temp2_max": 65261.85,
      "temp2_min": -273.15
    }
  },
  "acpitz-acpi-0": {
    "Adapter": "ACPI interface",
    "temp1": {
      "temp1_input": 39,
      "temp1_crit": 128
    }
  }
}
''')


class TestSensors(TestCase):
    def test_flatten_sensors(self):
        flat = flatten_sensors(SENSORS_INPUT)
        print(flat)
        self.assertEqual(11, len(flat))

    def test_extract_sensors(self):
        tensor = extract_sensors_tensor(SENSORS_INPUT)
        print(tensor)
        temp: tf.Tensor = tensor['temp']
        fan: tf.Tensor = tensor['fan_rpm']
        self.assertEqual((10,), temp.shape)
        self.assertEqual((1,), fan.shape)


class Test(TestCase):
    def test_extract_sensors_tensor_names(self):
        tensor = extract_sensors_tensor_names(SENSORS_INPUT)
        print(tensor)
        self.assertEqual(2, len(tensor))
