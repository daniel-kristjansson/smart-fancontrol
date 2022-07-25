import tensorflow as tf


def read_manualfan():
    try:
        with open("/tmp/fancontrol-manualfan", "r", 1) as file:
            return {"manualfan": int(file.read())}
    except (ValueError, FileNotFoundError):
        return {"manualfan": 1}


def set_manualfan(mode: int):
    with open("/tmp/fancontrol-manualfan", "w", 1) as file:
        file.write(str(mode) + "\n")


def extract_manualfan_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor([v], dtype=tf.int8) for k, v in d.items()}
