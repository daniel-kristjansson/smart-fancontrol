from unittest import TestCase
import tensorflow as tf

from smartfancontrol.features.usermode import extract_usermode_tensor, read_usermode, set_usermode

USERMODE_INPUT = {'usermode': 0}


class TestUsermode(TestCase):
    def test_read_usermode(self):
        set_usermode(1)
        input = read_usermode()
        print(input)
        tensor = extract_usermode_tensor(input)
        temp: tf.Tensor = tensor['usermode']
        self.assertEqual((1,), temp.shape)

    def test_extract_usermode_tensor(self):
        tensor = extract_usermode_tensor(USERMODE_INPUT)
        print(tensor)
        temp: tf.Tensor = tensor['usermode']
        self.assertEqual((1,), temp.shape)
