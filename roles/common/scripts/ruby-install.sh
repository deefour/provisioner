#!/bin/sh

cd /opt

wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/
make install

mkdir -p /opt/.ansible
touch /opt/.ansible/ruby-install-0.5.0
