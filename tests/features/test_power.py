from unittest import TestCase
import tensorflow as tf

from smartfancontrol.features.power import extract_power_tensor

POWER_INPUT = {'watts': 7.556295284889921, 'short_term': 44.0, 'long_term': 28.0}
POWER_INPUT_NO_WATTS = {'short_term': 44.0, 'long_term': 28.0}


class TestPower(TestCase):
    def test_extract_power_tensor(self):
        tensor = extract_power_tensor(POWER_INPUT)
        print(tensor)
        power: tf.Tensor = tensor['power']
        self.assertEqual((1,), power.shape)
        constraints: tf.Tensor = tensor['power_constraints']
        self.assertEqual((2,), constraints.shape)

    def test_extract_power_tensor_no_watts(self):
        tensor = extract_power_tensor(POWER_INPUT_NO_WATTS)
        print(tensor)
        self.assertFalse('power' in tensor)
        constraints: tf.Tensor = tensor['power_constraints']
        self.assertEqual((2,), constraints.shape)
