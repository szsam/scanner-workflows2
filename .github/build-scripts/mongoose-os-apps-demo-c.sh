#!/usr/bin/env bash

sudo add-apt-repository -y ppa:mongoose-os/mos
sudo apt-get update -y
sudo apt-get install -y mos

mos version
mos build --local --clean --platform esp8266
mos build --local --clean --platform esp32
mos build --local --clean --platform cc3200
mos build --local --clean --platform cc3220
mos build --local --clean --platform stm32 --board B-L475E-IOT01A
mos build --local --clean --platform stm32 --board DISCO-F746NG
mos build --local --clean --platform stm32 --board NUCLEO-F746ZG
