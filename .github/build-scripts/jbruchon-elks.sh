#!/usr/bin/env bash

# build script included
mkdir cross
tools/build.sh
. ./env.sh
make all
