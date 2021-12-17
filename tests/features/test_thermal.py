from unittest import TestCase
import tensorflow as tf

from smartfancontrol.features.thermal import extract_thermal_tensor, read_thermal

THERMAL_INPUT = {'temp': 58.0}


class TestThermal(TestCase):
    def test_read_thermal(self):
        input = read_thermal()
        print(input)
        tensor = extract_thermal_tensor(input)
        temp: tf.Tensor = tensor['temp']
        self.assertEqual((1,), temp.shape)

    def test_extract_thermal_tensor(self):
        tensor = extract_thermal_tensor(THERMAL_INPUT)
        print(tensor)
        temp: tf.Tensor = tensor['temp']
        self.assertEqual((1,), temp.shape)
