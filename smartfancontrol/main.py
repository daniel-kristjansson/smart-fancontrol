import time

from smartfancontrol.features import read_features, extract_features_tensor_dict, summarize_features_tensor
from smartfancontrol.controller import set_fan_level, set_wattage
from smartfancontrol.FanEnvironment import FanEnvironment

import pandas as pd
import tensorflow as tf
from tf_agents.environments import utils, tf_py_environment
import tf_agents.policies
from tf_agents.trajectories import time_step as ts
from tf_agents.trajectories.time_step import TimeStep

from smartfancontrol.logger import log


@tf.function
def action(step: TimeStep) -> tf.Tensor:
    temp = tf.math.reduce_mean(step.observation['temp'])
    level = tf.constant(7)
    if temp < 40:
        level = tf.constant(0)
    elif temp < 60:
        level = tf.constant(1)
    elif temp < 70:
        level = tf.constant(2)
    elif temp < 80:
        level = tf.constant(5)
    return level


def adjust_wattage(profile: int) -> (int, int):
    if profile == 0:
        return 12, 12
    elif profile == 1:
        return 20, 35
    else:
        return 28, 44


def collect_features_and_execute_once():
    features = extract_features_tensor_dict(read_features())
    level = action(ts.restart(features)).numpy()
    log(features, str(level))
    set_fan_level(level)
    set_wattage(adjust_wattage(2 if level < 2 else 1 if level < 3 else 0))


def ml():
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
    tf_env.close()


def main():
    # revs = [0.0, 2259.0, 2785.0, 2898.0, 3024.0, 3926.0, 4285.0, 4300.0]
    interval = 0.2  # seconds between runs
    while True:
        start = time.time()
        collect_features_and_execute_once()
        left = interval - (time.time() - start)
        if left > 0:
            time.sleep(left)
