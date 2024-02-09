#!/usr/bin/env bash

# https://docs.sel4.systems/projects/buildsystem/standalone.html
cmake -DCROSS_COMPILER_PREFIX= -DCMAKE_TOOLCHAIN_FILE=gcc.cmake -G Ninja -C configs/X64_verified.cmake -S. -B build_X64
cmake --build build_X64 -t kernel.elf
