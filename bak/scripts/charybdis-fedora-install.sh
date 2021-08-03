#!/bin/sh
dnf install -y git libtool m4 make libtool-ltdl-devel openssl-devel bison flex
git clone https://git.arching-kaos.net/kaotisk/charybdis.git
cd charybdis
./autogen.sh
./configure
make
make install


