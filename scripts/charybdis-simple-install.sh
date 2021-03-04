#!/bin/sh
echo "Attempting to download and install charybdis ircd"
echo "for any error, please file an issue."
git clone https://git.arching-kaos.net/kaotisk/charybdis.git
cd charybdis
./autogen.sh
./configure
make
make install
