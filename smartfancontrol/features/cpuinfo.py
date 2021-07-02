import ast
import re
from re import Pattern

PATTERN: Pattern[str] = re.compile(r'cpu MHz.*: (.*)')


def regex_line(line: str):
    global PATTERN
    result = PATTERN.search(line)
    if result and result.lastindex >= 1:
        return ast.literal_eval(result.group(1))
    return None


def extract_values(lines: list) -> dict:
    lst = list(filter(lambda val: val, [regex_line(line) for line in lines]))
    return {"cpu" + str(i) + "_mhz": lst[i] for i in range(0, len(lst))}


def read_cpuinfo() -> dict:
    with open("/proc/cpuinfo", "r", 1) as file:
        return extract_values(file.readlines())


def flatten_cpuinfo(d: dict) -> list:
    return [d[key] for key in sorted(d.keys())]
