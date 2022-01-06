import tensorflow as tf


def read_ac():
    with open("/sys/class/power_supply/AC/online", "r", 1) as file:
        try:
            return {"ac": int(file.read())}
        except ValueError:
            return {"ac": -1}


def extract_ac_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor([v], dtype=tf.int8) for k, v in d.items()}
