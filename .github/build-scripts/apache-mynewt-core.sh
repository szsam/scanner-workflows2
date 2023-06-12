#!/usr/bin/env bash

# Install newt
#https://mynewt.apache.org/latest/newt/install/newt_linux.html
#wget -qO - https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master/mynewt.gpg.key | sudo apt-key add -
#sudo tee /etc/apt/sources.list.d/mynewt.list <<EOF
#deb https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main
#EOF
sudo apt-get update -y
sudo apt-get install -y newt gcc-multilib

# .github/workflows/build_blinky.yml
cp .github/project.yml project.yml
newt upgrade --shallow=1
rm -rf $RUNNER_TEMP/blinky
git clone https://github.com/apache/mynewt-blinky.git $RUNNER_TEMP/blinky
cp -r $RUNNER_TEMP/blinky/apps/blinky/ apps/blinky
bash .github/test_build_blinky.sh

# .github/workflows/build_targets.yml
cp -r .github/targets ci_targets
ls ci_targets | xargs -n1 sh -c 'echo "Testing $0"; newt build -q $0'
