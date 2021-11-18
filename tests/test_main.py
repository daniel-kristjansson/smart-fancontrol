from unittest import TestCase

from smartfancontrol.features import extract_features_tensor
from smartfancontrol.main import ml, log
from tests.features.test_features import FEATURES_INPUT


class TestMain(TestCase):
    def test_ml(self):
        ml()

    def test_log(self):
        features = extract_features_tensor(FEATURES_INPUT)
        log(features, "7")
