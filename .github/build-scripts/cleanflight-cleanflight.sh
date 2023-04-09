#!/usr/bin/env bash

export GOAL=test-all
sudo apt-get update -y
sudo apt-get install -y libc6-i386 libblocksruntime-dev #lcov
make arm_sdk_install
make arm_sdk_version
./.travis.sh
