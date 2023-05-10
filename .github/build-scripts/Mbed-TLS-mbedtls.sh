#!/usr/bin/env bash

# https://github.com/Mbed-TLS/mbedtls

pip3 install jsonschema
cmake -DCMAKE_BUILD_TYPE=Release .
make -j$(nproc)
make test
sudo make install
