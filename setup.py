import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="smartfancontrol",
    version="0.0.2",
    author="Daniel Kristjansson",
    author_email="danielk@cuymedia.net",
    description="A Thinkpad fan control package",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/pypa/smart-fancontrol",
    project_urls={
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD 3-Clause License",
        "Operating System :: Linux",
    ],
    packages=["smartfancontrol"],
    python_requires=">=3.6",
    scripts=['bin/fancontrol'],
)
