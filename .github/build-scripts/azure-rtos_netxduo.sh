#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install -y ninja-build

git clone https://github.com/azure-rtos/threadx.git
cd threadx
cmake -Bbuild -GNinja -DCMAKE_TOOLCHAIN_FILE=cmake/cortex_m4.cmake .
cmake --build ./build
cd ..

cmake -Bbuild -GNinja -DCMAKE_TOOLCHAIN_FILE=cmake/cortex_m4.cmake .
cmake --build ./build