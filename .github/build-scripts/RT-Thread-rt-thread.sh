#!/usr/bin/env bash

export RTT_EXEC_PATH="$(dirname $(which arm-none-eabi-gcc))"
cd bsp

scons -j$(nproc) -C qemu-vexpress-a9
#scons -j$(nproc) -C stm32/stm32f103-atk-nano
scons -j$(nproc) -C stm32/stm32l4r5-st-nucleo
scons -j$(nproc) -C stm32/stm32f207-st-nucleo
scons -j$(nproc) -C stm32/stm32f746-st-disco
scons -j$(nproc) -C lpc55sxx/lpc55s69_nxp_evk
scons -j$(nproc) -C gd32/arm/gd32103c-eval
scons -j$(nproc) -C nrf5x/nrf51822
