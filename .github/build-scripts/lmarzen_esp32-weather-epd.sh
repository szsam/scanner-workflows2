#!/usr/bin/env bash

sudo apt install python3.9
sudo apt-get install python3.9-distutils
python3.9 -m pip install --upgrade platformio
pio run -d platformio
