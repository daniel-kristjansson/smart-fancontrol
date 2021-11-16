def send_fan(string: str):
    with open("/proc/acpi/ibm/fan", "w", 1) as file:
        file.write(string + "\n")


def set_fan_level(level: int):
    send_fan("level " + str(level))


def set_fan_auto():
    send_fan("level auto")


def set_wattage(watts: (float, float)):
    lt_microwatts = str(int(watts[0] * 1000000)) + "\n"
    st_microwatts = str(int(watts[1] * 1000000)) + "\n"
    long_term_dev = "/sys/devices/virtual/powercap/intel-rapl-mmio/intel-rapl-mmio:0/constraint_0_power_limit_uw"
    short_term_dev = "/sys/devices/virtual/powercap/intel-rapl-mmio/intel-rapl-mmio:0/constraint_1_power_limit_uw"
    with open(long_term_dev, "w", 1) as file:
        file.write(lt_microwatts)
    with open(short_term_dev, "w", 1) as file:
        file.write(st_microwatts)
