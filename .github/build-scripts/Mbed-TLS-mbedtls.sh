#!/usr/bin/env bash

pip3 install jsonschema
cmake -DCMAKE_BUILD_TYPE=Release .
make -j$(nproc)
make test
sudo make install
