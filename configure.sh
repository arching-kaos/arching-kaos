#!/bin/sh
echo "Getting the basics done..."

echo "Initializing and updating modules..."
cd modules
git submodule init arching-kaos-api
git submodule update arching-kaos-api
git submodule init arching-kaos-radio
git submodule update arching-kaos-radio
git submodule init docker-dat-store
git submodule update docker-dat-store
cd ..

echo "Configuring /etc ..."
sh ./scripts/configure-charybdis.sh
sh ./scripts/configure-icecast.sh
sh ./scripts/configure-liquidsoap.sh
sh ./scripts/configure-nginx.sh

echo "Getting docker scripts ready ..."
sh ./scripts/fix-base-path.sh
