#!/usr/bin/env bash

sudo apt-get install kconfig-frontends

git clone https://github.com/apache/nuttx-apps.git ../apps

for cfg in $(./tools/configure.sh  -L | grep 'stm32f103-minimum'); do
  make distclean
  ./tools/configure.sh $cfg
  make CROSSDEV=arm-none-eabi- -j$(nproc)
done

rm -rf ../apps
