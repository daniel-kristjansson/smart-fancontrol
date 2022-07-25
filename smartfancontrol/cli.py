from smartfancontrol.features.manualfan import set_manualfan
from smartfancontrol.features.usermode import set_usermode, read_usermode

import argparse


def parse():
    parser = argparse.ArgumentParser(description='fancontrol daemon settings')
    parser.add_argument('-f', '--fan-level', type=int,
                        help='Force fan level to value between [0-7]')
    parser.add_argument('-m', '--user-mode', type=str,
                        help='One of four operational modes [noisy,normal,quiet,manual]')
    return parser


def parse_usermode(mode: str):
    d = {
        "noisy": 0,
        "normal": 1,
        "quiet": 2,
        "manual": 3
    }
    return d[mode.lower()]


def main():
    parser = parse()
    args = parser.parse_args()
    if args.fan_level is not None:
        set_usermode(3)
        set_manualfan(args.fan_level)
        print("fan level " + str(args.fan_level))
    if args.user_mode:
        um = parse_usermode(args.user_mode)
        set_usermode(um)
        print("user mode " + str(um))
    print("current state")
    #print("fan level" + str())
    print("user mode " + str(read_usermode()))
