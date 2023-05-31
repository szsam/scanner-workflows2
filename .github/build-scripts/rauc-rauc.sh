#!/usr/bin/env bash

#sudo apt-get install -y build-essential meson automake libtool libdbus-1-dev libglib2.0-dev libcurl3-dev libssl-dev
#sudo apt-get install -y libnl-genl-3-dev
#sudo apt-get install -y libjson-glib-dev
#meson setup build
#meson compile -C build

./autogen.sh
./configure
make
