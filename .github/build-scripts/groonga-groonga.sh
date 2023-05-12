#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y autoconf-archive
./autogen.sh
./configure --prefix=/tmp/local --enable-debug --enable-mruby --with-ruby
make -j$(grep '^processor' /proc/cpuinfo | wc -l)
