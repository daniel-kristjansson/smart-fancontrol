import tensorflow as tf


def read_lapmode():
    with open("/sys/module/thinkpad_acpi/drivers/platform:thinkpad_acpi/thinkpad_acpi/dytc_lapmode", "r", 1) as file:
        try:
            return {"lapmode": int(file.read())}
        except ValueError:
            return {"lapmode": -1}


def extract_lapmode_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor([v], dtype=tf.float32) for k, v in d.items()}
