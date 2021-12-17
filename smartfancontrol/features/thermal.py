import tensorflow as tf


def read_thermal():
    with open("/sys/bus/platform/devices/thinkpad_hwmon/hwmon/hwmon5/temp1_input", "r", 1) as file:
        value = file.read()
        return {"temp": float(value) / 1000.0}


def extract_thermal_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor([v], dtype=tf.float32) for k, v in d.items()}
