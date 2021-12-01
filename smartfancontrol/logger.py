import datetime
import sys
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import tensorflow as tf

from smartfancontrol.features import summarize_features_tensor

log_counter = 0
buffer_size = 100
features_dt_path = "/var/log/fancontrol/featurelog.ng"
features_dt = None


def info_log(message: str):
    global log_counter
    log_counter += 1
    print(str(datetime.datetime.utcnow()), message)
    if log_counter > 10:
        sys.stdout.flush()
        log_counter = 0


def numpyfy(features: dict[str, tf.Tensor]):
    n = {}
    for key, value in features.items():
        nlist = value.numpy()
        n[key] = nlist
#        if len(nlist) == 1:
#            n[key] = nlist[0]
#        else:
#            for i in range(len(nlist)):
#                n[key + str(i)] = nlist[i]
    return n


def listify(non_list_features: dict):
    return {key: [value] for key, value in non_list_features.items()}


def handle_file_writing(dt: pd.DataFrame):
    info_log("Writing to feature log")
    print(dt)
    features_pa = pa.Table.from_pandas(dt)
    pq.write_to_dataset(
        features_pa, root_path=features_dt_path, partition_cols=['year', 'month', 'day'], compression='snappy')


# FIXME this is not a reasonably efficient way to do this!!
def feature_log(features: dict[str, tf.Tensor], label: int):
    global features_dt
    when = datetime.datetime.utcnow()
    data = {
        "timestamp": when.timestamp(),
        "year": when.date().year,
        "month": when.date().month,
        "day": when.date().day,
        "label": tf.constant(label, dtype=tf.int32).numpy(),
    }
    data |= numpyfy(features)
    if features_dt is not None:
        features_dt = features_dt.append(data, ignore_index=True)
    else:
        features_dt = pd.DataFrame(listify(data))
    if features_dt.shape[0] >= buffer_size:
        dt = features_dt
        features_dt = None
        handle_file_writing(dt)


def log(features: dict[str, tf.Tensor], label: int, label2: int):
    fan_level = "{0} {1}".format(label, label2)
    info_log(' '.join([summarize_features_tensor(features), "fan_level", fan_level]))
    feature_log(features, label)
