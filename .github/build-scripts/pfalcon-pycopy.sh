#!/usr/bin/env bash

# maybe need dependencies?
make -C mpy-cross
cd ports/unix
make submodules
make
