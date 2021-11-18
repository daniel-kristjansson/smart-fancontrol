from unittest import TestCase
from smartfancontrol.features.stat import extract_values, read_stat

TEXT = '''
cpu  5742201 2794147 3247429 136931889 184678 0 96634 0 0 0
cpu0 777742 351759 424519 17136022 20336 0 13330 0 0 0
cpu1 750664 343586 438297 16309032 20484 0 36196 0 0 0
cpu2 745596 350306 432701 17165172 19179 0 2943 0 0 0
cpu3 731859 350215 406226 17222450 18799 0 2562 0 0 0
cpu4 636247 351207 386449 17285782 17915 0 16607 0 0 0
cpu5 705274 351769 383082 17295480 16397 0 2505 0 0 0
cpu6 689428 348155 386373 17237319 53842 0 16261 0 0 0
cpu7 705387 347147 389777 17280629 17724 0 6226 0 0 0
intr 662847645 13 614 0 0 0 0 0 0 0 31443453 0 0 3041 0 0 0 3 0 0 0 0 0 0 0
'''

STAT_INPUT = {'cpu_user': 0.075, 'cpu_nice': 0.0, 'cpu_system': 0.025, 'cpu_idle': 0.9,
              'cpu0_user': 0.075, 'cpu0_nice': 0.0, 'cpu0_system': 0.025, 'cpu0_idle': 0.9}


class TestStat(TestCase):
    def test_extract_values(self):
        values = extract_values(TEXT.splitlines())
        print(values)

    def test_read_stat(self):
        print(read_stat())
