#!/usr/bin/env bash

sudo apt-get install -y cmake
sudo apt-get install -y libopencv-dev
# opencv 3.0.0 needs to be installed here.
# openmp should come w gcc compiler
mkdir build && cd build
cmake ../
make
