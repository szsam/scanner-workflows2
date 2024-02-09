#!/usr/bin/env bash

cd ports/cortex-m
make clean
make -j$(nproc)
