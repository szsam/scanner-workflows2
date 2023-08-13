#!/usr/bin/env bash

sudo apt-get install -y ninja-build
ninja --version
cmake --version
gcc --version
sudo apt-get update && \
sudo apt-get install -y \
    build-essential \
    nasm \
    libogg-dev \
    libxft-dev \
    libx11-dev \
    libxxf86vm-dev \
    libopenal-dev \
    libfreetype6-dev \
    libxcursor-dev \
    libxinerama-dev \
    libxi-dev \
    libxrandr-dev \
    libxss-dev \
    libglu1-mesa-dev \
    libgtk-3-dev

cmake -S. -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DTORQUE_APP_NAME=Torque3D -DTORQUE_TESTING=ON
cmake --build build
