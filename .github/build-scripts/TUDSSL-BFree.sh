#!/usr/bin/env bash

cd software/nvm-controller/
./configure
cd build && make
cd ..
cd BFree-core
cd ports/atmel-samd
make BOARD=metro_m0_express
