#!/usr/bin/env bash

#cd FreeRTOS/Demo/Posix_GCC/
#make -j$(nproc)

# .github/workflows/kernel-unit-tests.yml
sudo apt-get install -y lcov cflow ruby doxygen build-essential unifdef

make -C FreeRTOS/Test/CMock clean
make -C FreeRTOS/Test/CMock ENABLE_SANITIZER=1 run_col_formatted
