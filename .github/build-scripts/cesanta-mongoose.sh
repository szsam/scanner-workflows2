#!/usr/bin/env bash

./test/setup_ga_network.sh && sudo apt-get -y update ; sudo apt-get -y install libmbedtls-dev && make test mip_test
