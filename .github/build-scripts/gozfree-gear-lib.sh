#!/usr/bin/env bash

mkdir build_linux
cd build_linux
cmake ../
make -j$(nproc)
