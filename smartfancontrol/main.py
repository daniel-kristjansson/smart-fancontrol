import time

from smartfancontrol.features import read_features, extract_features_tensor_dict, summarize_features_tensor
from smartfancontrol.controller import set_fan_level, set_wattage
from smartfancontrol.FanEnvironment import FanEnvironment

import tensorflow as tf
from tf_agents.environments import utils, tf_py_environment
import tf_agents.policies
from tf_agents.trajectories import time_step as ts
from tf_agents.trajectories.time_step import TimeStep

from smartfancontrol.logger import log

LINEAR_MODEL = None


@tf.function
def heuristic_action(step: TimeStep) -> tf.Tensor:
    temp = tf.math.reduce_max(step.observation['temp'])
    level = tf.constant(7)
    if temp < 40:
        level = tf.constant(0)
    elif temp < 60:
        level = tf.constant(1)
    elif temp < 80:
        level = tf.constant(1)
    elif temp < 90:
        level = tf.constant(2)
    return level


def clamp(value, minimum, maximum):
    return max(minimum, min(value, maximum))


@tf.function
def linear_action(step: TimeStep) -> tf.Tensor:
    f = {'power': step.observation['power'], 'temp': tf.reshape(step.observation['temp'], (1, 10))}
    out = LINEAR_MODEL(f)
    return tf.cast(tf.reshape(tf.round(tf.clip_by_value(out, 0, 7)), ()), tf.int32)


def adjust_wattage(step: TimeStep) -> (int, int):
    temp = tf.math.reduce_max(step.observation['temp'])
    if temp >= 90:
        return 12, 12
    elif temp >= 80:
        return 20, 20
    else:
        return 28, 44


def collect_features_and_execute_once():
    features = extract_features_tensor_dict(read_features())
    step = ts.restart(observation=features)
    level = heuristic_action(step).numpy()
    lin_level = linear_action(step).numpy()
    log(features, int(level), int(lin_level))
    set_fan_level(level)
    set_wattage(adjust_wattage(step))


def ml_env():
    env = FanEnvironment()
    print(env.reward_spec())
    print(env.discount_spec())
    tf_env = tf_py_environment.TFPyEnvironment(env)
    state1 = tf_env.reset()
    print(state1)
    state2 = ts.transition(
        observation=extract_features_tensor_dict(read_features()),
        reward=tf.constant([0.0]),
        discount=state1.discount
    )
    print(state2)
    # utils.validate_py_environment(tf_env, state1)
    tf_env.close()


def disable_gpu():
    try:
        tf.config.set_visible_devices([], 'GPU')
    except:
        pass


def ml_linear():
    global LINEAR_MODEL
    LINEAR_MODEL = tf.keras.models.load_model('/home/danielk/code/smart-fancontrol/features/clean_train')
    print(LINEAR_MODEL.summary())
    tf_env = tf_py_environment.TFPyEnvironment(FanEnvironment())
    state1 = tf_env.reset()
    f = {'power': state1.observation['power'], 'temp': tf.reshape(state1.observation['temp'], (1, 10))}
    print(LINEAR_MODEL.predict(f))


def main():
    # revs = [0.0, 2259.0, 2785.0, 2898.0, 3024.0, 3926.0, 4285.0, 4300.0]
    interval = 0.2  # seconds between runs
    ml_linear()
    while True:
        start = time.time()
        collect_features_and_execute_once()
        left = interval - (time.time() - start)
        if left > 0:
            time.sleep(left)
