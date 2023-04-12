#!/usr/bin/env bash

cp contrib/examples/example_app/lwipcfg.h.ci contrib/examples/example_app/lwipcfg.h
mkdir build && cd build && cmake .. -G Ninja && cmake --build .
