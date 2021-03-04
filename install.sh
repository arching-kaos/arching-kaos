#!/bin/sh
echo "Welcome to arching-kaos installation."


#TODO basic fedora install from the other repo
#cjdroute-strip-comment.sh
#data
echo "Starting docs..."
sh ./scripts/docker-arching-kaos-docs.sh
echo "Starting icecast..."
sh ./scripts/docker-icecast.sh
echo "Starting ipfs..."
sh ./scripts/docker-ipfs.sh
echo "Starting opentracker..."
sh ./scripts/docker-opentracker.sh
echo "Starting ssb..."
sh ./scripts/docker-ssb-create.sh
#export

#gen-playlist.sh
#grep-env.sh
#pwd.sh
#run-dat-gateway.sh
#run-dat.sh
#sed-example.sh
echo "Starting liquidsoap..."
sh ./scripts/docker-liquidsoap.sh

echo "Starting API..."
cd modules/arching-kaos-api
./install.sh
cd ../..

echo "Starting webpage..."
cd modules/arching-kaos-radio
./start.sh
cd ../..

echo "Starting dat-store..."
cd modules/docker-dat-store
sh ./build.sh
sh ./start.sh
cd ../..

