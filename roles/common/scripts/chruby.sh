#!/bin/sh

cd /opt

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
make install

mkdir -p /opt/.ansible

file=/opt/.ansible/chruby-0.3.9

test -e "$file" || touch "$file"
