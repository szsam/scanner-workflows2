#!/usr/bin/env bash

sudo apt-get install kconfig-frontends

git clone https://github.com/apache/nuttx-apps.git ../apps

./tools/configure.sh stm32f103-minimum:hello
make -j$(nproc)

rm -rf ../apps
