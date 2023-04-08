#!/usr/bin/env bash

./scripts/install-prerequisites.sh
python3 tests/main.py --build-option=OPTIONS_NORMAL_8BIT build
