import tensorflow as tf


# There are several user modes
# 0 -- noise ok
# 1 -- moderate noise ok
# 2 -- limit noise
# 4 -- user control

def read_usermode():
    try:
        with open("/tmp/fancontrol-usermode", "r", 1) as file:
            return {"usermode": int(file.read())}
    except (ValueError, FileNotFoundError):
        return {"usermode": 1}


def set_usermode(mode: int):
    with open("/tmp/fancontrol-usermode", "w", 1) as file:
        file.write(str(mode) + "\n")


def extract_usermode_tensor(d: dict) -> dict:
    return {k: tf.convert_to_tensor([v], dtype=tf.int8) for k, v in d.items()}
