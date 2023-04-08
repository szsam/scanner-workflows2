#!/usr/bin/env bash

sudo apt-get install libffi-dev # for header ffi.h
source tools/ci.sh && ci_unix_standard_build
