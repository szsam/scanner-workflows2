#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev ca-certificates
mkdir cmake
cd cmake
cmake ..
cmake --build . -- -j$(nproc)
