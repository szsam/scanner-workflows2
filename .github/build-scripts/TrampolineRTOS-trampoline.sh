#!/usr/bin/env bash

cd goil/makefile-unix/
./build.py release
cd -
GOIL="$(realpath goil/makefile-unix/goil) "
export GOIL_TEMPLATES="$(realpath goil/templates)"

# Not needed if we do not actually run the apps
#cd viper && make && cd -

cd examples/posix/one_task
$GOIL --target=posix/linux one_task.oil
./make.py
