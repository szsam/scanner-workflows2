#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install -y ninja-build

cd Microchip/ATSAME54-XPRO
cmake -Bbuild -GNinja -DCMAKE_TOOLCHAIN_FILE="../../cmake/cortex_m4.cmake"
cmake --build build