#!/usr/bin/env bash

for d in $(find examples/ -maxdepth 1 -type d); do
  make -C "$d" -j$(nproc)
done
