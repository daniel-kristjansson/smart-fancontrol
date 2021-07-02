from unittest import TestCase
from smartfancontrol.features.cpuinfo import extract_values, read_cpuinfo

TEXT = '''
cpu family      : 6
cpu MHz         : 1139.910
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
cpu family      : 6
cpu MHz         : 1070.441
cpu cores       : 4
cpu family      : 6
cpu MHz         : 2800.000
cpu cores       : 4
'''


class Test(TestCase):
    def test_extract_values(self):
        values = extract_values(TEXT.splitlines())
        self.assertEqual(8, len(values))
        self.assertIsInstance(list(values.keys())[0], str)
        self.assertIsInstance(list(values.values())[0], float)


class Test(TestCase):
    def test_read_cpuinfo(self):
        print(read_cpuinfo())
