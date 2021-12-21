from unittest import TestCase
import tensorflow as tf

from smartfancontrol.features.lapmode import extract_lapmode_tensor, read_lapmode

LAPMODE_INPUT = {'lapmode': 0}


class TestLapmode(TestCase):
    def test_read_lapmode(self):
        input = read_lapmode()
        print(input)
        tensor = extract_lapmode_tensor(input)
        temp: tf.Tensor = tensor['lapmode']
        self.assertEqual((1,), temp.shape)

    def test_extract_lapmode_tensor(self):
        tensor = extract_lapmode_tensor(LAPMODE_INPUT)
        print(tensor)
        temp: tf.Tensor = tensor['lapmode']
        self.assertEqual((1,), temp.shape)
