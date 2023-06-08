#!/usr/bin/env bash

export RTT_EXEC_PATH="$(dirname $(which arm-none-eabi-gcc))"
cd bsp/stm32/stm32f103-atk-nano
scons -j$(nproc)
