#!/usr/bin/env bash

#mkdir build_linux
#cd build_linux
#cmake ../
#make -j$(nproc)

sudo apt-get update -y
sudo apt-get install -y liblua5.2-dev libjansson-dev libpulse-dev libx264-dev libavcodec-dev libavformat-dev libavutil-dev libuvc-dev protobuf-compiler
./build.sh
