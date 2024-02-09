#!/usr/bin/env bash

sudo apt-get -y -qq update
sudo apt-get -y -qq install cmake ninja-build

# build test
cmake -S. -Bbuild -GNinja
cmake --build build -v

# example test
bash ./.example-test.sh

# stdc++ test
bash ./.stdc++-test.sh

# unit test
make all -f .unit-test.make
