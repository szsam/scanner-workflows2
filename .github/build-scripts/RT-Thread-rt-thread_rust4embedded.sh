#!/usr/bin/env bash

set -e

export RTT_EXEC_PATH="$(dirname $(which arm-none-eabi-gcc))"
cd bsp

# #scons -j$(nproc) -C qemu-vexpress-a9 # got stuck when building db
# scons -j$(nproc) -C stm32/stm32l4r5-st-nucleo
scons -j$(nproc) -C stm32/stm32f103-atk-nano
# scons -j$(nproc) -C stm32/stm32f207-st-nucleo
# scons -j$(nproc) -C stm32/stm32f746-st-disco
# scons -j$(nproc) -C lpc55sxx/lpc55s69_nxp_evk
# #scons -j$(nproc) -C gd32/arm/gd32103c-eval #compile error
# scons -j$(nproc) -C n32/n32g43xcl-stb
# scons -j$(nproc) -C apm32/apm32f103xe-minibroard
# scons -j$(nproc) -C nrf5x/nrf51822
# scons -j$(nproc) -C Infineon/psoc6-cy8ckit-062S2-43012
# scons -j$(nproc) -C fujitsu/mb9x/mb9bf500r
# #scons -j$(nproc) -C raspberry-pico # got stuck when building db
