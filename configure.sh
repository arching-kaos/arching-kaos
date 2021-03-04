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

echo "Configuring modules..."
echo "... docker-dat-store"
sed -i.bak -e 's/{$PWD}/\/home\/kaotisk\/projects\/arching-kaos/' modules/docker-dat-store/start.sh
sed -i.bak -e 's/{$PWD}/\/home\/kaotisk\/projects\/arching-kaos/' modules/docker-dat-store/start.sh
echo "... arching-kaos-api"
sh ./scripts/configure-aka-module.sh

echo "Configuring /etc ..."
echo "... charybdis"
sh ./scripts/configure-charybdis.sh
echo "... icecast"
sh ./scripts/configure-icecast.sh
echo "... liquidsoap"
sh ./scripts/configure-liquidsoap.sh
echo "... nginx"
sh ./scripts/configure-nginx.sh

echo "Getting docker scripts ready ..."
sh ./scripts/fix-base-path.sh
