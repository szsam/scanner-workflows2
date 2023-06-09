#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install -y ninja-build

./scripts/buildAllConfigurations.sh configurations
