#!/usr/bin/env bash

sudo apt-get -y install automake libtool
git clone https://github.com/wolfSSL/wolfssl.git
cd wolfssl
./autogen.sh
./configure --enable-certgen --enable-certreq --enable-certext --enable-pkcs7 --enable-cryptocb --enable-aescfb
make
sudo make install
sudo ldconfig
cd ..
./autogen.sh
./configure --enable-infineon --with-wolfcrypt=wolfssl
make
