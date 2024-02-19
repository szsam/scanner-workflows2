#!/usr/bin/env bash


sudo apt install scons -y
python3 -m pip install numpy matplotlib tensorflow scikit-learn
sed -i 's/np\.int/int/g' ./scripts/gen_config.py
sed -i 's/np\.int/int/g' ./examples/auto_test/main.py 
cd examples/auto_test && python3 main.py
