#!/usr/bin/env bash

cd goil/makefile-unix/
./build.py release
cd -
GOIL="$(realpath goil/makefile-unix/goil)"
export GOIL_TEMPLATES="$(realpath goil/templates)"

# Not needed if we do not actually run the apps
#cd viper && make && cd -

for app in $(find "$PWD/examples/posix/" -mindepth 1 -maxdepth 1 -type d); do
  cd "$app"
  $GOIL --target=posix/linux *.oil
  ./make.py
  ./make.py clean
done

for app in $(find "$PWD/examples/arm/nxt" -mindepth 1 -maxdepth 1 -type d); do
  cd "$app"
  $GOIL --target=arm/nxt *.oil
  make -j$(nproc)
  make clean
done
