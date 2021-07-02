import subprocess
import json


def read_mpstat() -> dict:
    process = subprocess.Popen(["mpstat", "-o", "JSON"],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return json.loads(stdout)

def flatten_mpstat(d: dict) -> list:
    filt = d["sysstat"]["hosts"][0]["statistics"][0]["cpu-load"][0]
    return [filt["usr"], filt["nice"], filt["sys"]]
