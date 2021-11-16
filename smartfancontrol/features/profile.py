def read_profile():
    with open("/sys/firmware/acpi/platform_profile", "r", 1) as file:
        value = file.read()
        if value.startswith("low-power"):
            return {"platform_profile": 0}
        elif value.startswith("performance"):
            return {"platform_profile": 2}
        return {"platform_profile": 1}  # balanced


def flatten_profile(d: dict) -> list:
    return [d[key] for key in sorted(d.keys())]
