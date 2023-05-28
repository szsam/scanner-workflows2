#!/usr/bin/env bash


git submodule update --init --recursive
sudo apt-get install -y libev-dev libssl-dev liblua5.2-dev
mkdir build
cd build
cmake ../
make
