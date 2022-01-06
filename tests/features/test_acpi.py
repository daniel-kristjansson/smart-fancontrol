from unittest import TestCase
import tensorflow as tf

from smartfancontrol.features.acpi import extract_acpi_tensor, read_acpi

ACPI_INPUT = {'ac': 0}


class Testac(TestCase):
    def test_read_acpi(self):
        input = read_acpi()
        print(input)
        tensor = extract_acpi_tensor(input)
        temp: tf.Tensor = tensor['ac']
        self.assertEqual((1,), temp.shape)

    def test_extract_acpi_tensor(self):
        tensor = extract_acpi_tensor(ACPI_INPUT)
        print(tensor)
        temp: tf.Tensor = tensor['ac']
        self.assertEqual((1,), temp.shape)
