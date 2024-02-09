#!/usr/bin/env bash

sudo apt-get update -yqq && sudo apt-get install -yqq software-properties-common
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update -yqq
sudo apt-get install -yqq wget git unzip libxml2-dev cmake make systemtap-sdt-dev \
                     zlib1g-dev libpcre3-dev libargon2-0-dev libsodium-dev \
                     php7.4-cli php7.4-dev libphp7.4-embed php7.4-mysql

git clone https://github.com/rryqszq4/ngx_php7.git

wget 'http://nginx.org/download/nginx-1.18.0.tar.gz'
tar -zxvf nginx-1.18.0.tar.gz
cd nginx-1.18.0

export PHP_LIB=/usr/lib

./configure --user=www --group=www \
            --prefix=/path/to/nginx \
            --with-ld-opt="-Wl,-rpath,$PHP_LIB" \
            --add-module=/path/to/ngx_php7/third_party/ngx_devel_kit \
            --add-module=/path/to/ngx_php7
make && make install
