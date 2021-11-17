import numpy as np
import tensorflow as tf
from tf_agents.specs.array_spec import BoundedArraySpec, ArraySpec
from tf_agents.environments import py_environment, tf_py_environment
from tf_agents.trajectories import time_step as ts



class FanEnvironment(py_environment.PyEnvironment):
    """
    Simulation environment for the ThinkPad fan control
    """
    MAX_TIME = 30 * 600
 
    def __init__(self):
        super().__init__()
        self._observation_spec = self.observation_spec()
        self._observation = {
            "temp": tf.constant([50.0]),
            "fan_rpm": tf.constant([2000.0]),
            "cpuinfo": tf.constant([2800.0]),
            "stats": tf.constant([0.9]),
            "power": tf.constant([20.0])
        }
        self._t = 0

    @property
    def _episode_ended(self):
        return self._t > self.MAX_TIME


    def observation_spec(self):
        """
        Defines the observation spec
        """
        return { 
            "temp": ArraySpec(
                shape=(1,),
                dtype=np.float32,
                name="temp"),
            "fan_rpm": ArraySpec(
                shape=(1,),
                dtype=np.float32,
                name="fan_rpm"),
            "cpuinfo": BoundedArraySpec(
                shape=(1,),
                dtype=np.float32,
                minimum=0,
                maximum=5000,
                name="country"),
            "stats": ArraySpec(
                shape=(1,),
                dtype=np.float32,
                name="stats"),
            "power": BoundedArraySpec(
                shape=(1,),
                dtype=np.float32,
                minimum=0.0,
                maximum=50.0,
                name="power"),
        }

    def action_spec(self):
        """
        Defines the action space as a single number in [0,7]. 0 is fan off, 7 is fan at maximum speed.
        Ideally we'd also control wattage to the cpu here, but multi-dimentional actions do not appear
        to be supported.
        """
        return BoundedArraySpec(
            shape=(),
            dtype=np.int32,
            minimum=0,
            maximum=7,
            name="action"
        )

    def _reset(self):
        self._t = 0
        self._observation = {
            "temp": tf.constant([50.0]),
            "fan_rpm": tf.constant([2000.0]),
            "cpuinfo": tf.constant([2800.0]),
            "stats": tf.constant([0.9]),
            "power": tf.constant([20.0])
        }

        return ts.restart(
            observation=self._observation
        )
    
    def  _step(self, action):
        if self._episode_ended:
            return ts.termination(
                observation=self._observation,
                reward=reward
            )
        else:
            return ts.transition(
                observation=self._observation,
                reward=reward,
                discount=0.9
            )
