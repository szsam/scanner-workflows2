#!/usr/bin/env bash

cmake -Bbuild -S. -GNinja
cmake --build build/
