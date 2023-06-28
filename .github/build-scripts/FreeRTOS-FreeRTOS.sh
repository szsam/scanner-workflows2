#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install build-essential cmake git ninja-build python3-minimal

make -j$(nproc) -C FreeRTOS/Demo/Posix_GCC
make            -C FreeRTOS/Demo/Posix_GCC clean
make -j$(nproc) -C FreeRTOS/Demo/Posix_GCC USER_DEMO=BLINKY_DEMO

make -j$(nproc) -C FreeRTOS/Demo/CORTEX_MPU_M3_MPS2_QEMU_GCC
make -j$(nproc) -C FreeRTOS/Demo/CORTEX_LM3S102_GCC
make -j$(nproc) -C FreeRTOS/Demo/CORTEX_M3_MPS2_QEMU_GCC
make            -C FreeRTOS/Demo/CORTEX_M3_MPS2_QEMU_GCC clean
make -j$(nproc) -C FreeRTOS/Demo/CORTEX_M3_MPS2_QEMU_GCC FULL_DEMO=1
make -j$(nproc) -C FreeRTOS/Demo/CORTEX_LM3S811_GCC
# FreeRTOS/Demo/ThirdParty/Community-Supported/CORTEX_M0+_RP2040
make -j$(nproc) -C FreeRTOS/Demo/CORTEX_MPS2_QEMU_IAR_GCC/build/gcc
