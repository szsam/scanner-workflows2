#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install -y build-essential cmake g++-multilib libgcc-9-dev lib32gcc-9-dev

cd product-mini/platforms/linux/
./build_llvm.sh
#(The llvm source code is cloned under <wamr_root_dir>/core/deps/llvm and auto built)
