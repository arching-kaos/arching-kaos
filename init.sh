#!/bin/bash
CUR=$(pwd)
dnf install git podman cjdns cjdns-tools vim -y
git clone https://github.com/kaotisk-hund/python-cjdns-peering-tools
git clone https://github.com/kaotisk-hund/arching-kaos
cd python-cjdns-peering-tools/
./gen.sh
CJDNS=$(cjdns-online)
cd $CUR
cd arching-kaos
./install.sh

