#!/usr/bin/env bash

python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install wheel
python3 -m pip install -r tools/mcuboot/requirements.txt

wget 'https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip'
unzip nRF5_SDK_15.3.0_59ac345
ls -al
mkdir build
cd build
cmake .. -DNRF5_SDK_PATH=$(realpath nRF5_SDK_15.3.0_59ac345)  #-DARM_NONE_EABI_TOOLCHAIN_PATH=arm-none-eabi-gcc
make -j$(nproc) pinetime-app
