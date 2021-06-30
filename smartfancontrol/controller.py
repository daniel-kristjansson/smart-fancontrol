def send_fan(string: str):
    with open("/proc/acpi/ibm/fan","w",1) as file:
        file.write(string + "\n")

def set_fan_level(level: int):
    send_fan("level "+ str(level))

def set_fan_auto():
    send_fan("level auto")
