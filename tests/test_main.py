from unittest import TestCase

from smartfancontrol.features import extract_features_v4_tensor_dict
from smartfancontrol.main import log, ml_env, ml_linear
from tests.features.test_features import FEATURES_V4_INPUT


class TestMain(TestCase):
    def test_ml_env(self):
        ml_env()

    def test_ml_linear(self):
        ml_linear()

    def test_log(self):
        features = extract_features_v4_tensor_dict(FEATURES_V4_INPUT)
        log(features, 7, 12)
