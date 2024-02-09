#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install libmbedtls-dev libpcap-dev
make clean examples
#cd examples/http-server
#make example
