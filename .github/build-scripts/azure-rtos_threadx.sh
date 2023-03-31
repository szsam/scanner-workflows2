#!/usr/bin/env bash

#sudo apt install cmake ninja
cmake -Bbuild -GNinja -DCMAKE_TOOLCHAIN_FILE=cmake/cortex_m4.cmake .
cmake --build ./build