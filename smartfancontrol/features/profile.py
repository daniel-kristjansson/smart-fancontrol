import tensorflow as tf


def read_profile():
    with open("/sys/firmware/acpi/platform_profile", "r", 1) as file:
        value = file.read()
        if value.startswith("low-power"):
            return {"profile": 0}
        elif value.startswith("performance"):
            return {"profile": 2}
        return {"profile": 1}  # balanced


def extract_profile_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor(v, dtype=tf.float32) for k, v in d.items()}

