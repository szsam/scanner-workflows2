#!/usr/bin/env bash

sudo apt-get install -y python3-dev
python3 -m pip install mbed-tools

mbed-tools deploy
mbed-tools compile -m DISCO_L475VG_IOT01A -t GCC_ARM
