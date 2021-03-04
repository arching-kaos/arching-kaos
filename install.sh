#!/bin/sh
echo "Welcome to arching-kaos installation."


#TODO basic fedora install from the other repo
#cjdroute-strip-comment.sh
#data

sh ./scripts/docker-arching-kaos-docs.sh
sh ./scripts/docker-icecast.sh
sh ./scripts/docker-ipfs.sh
sh ./scripts/docker-opentracker.sh
sh ./scripts/docker-ssb-create.sh
#export

#gen-playlist.sh
#grep-env.sh
#pwd.sh
#run-dat-gateway.sh
#run-dat.sh
#sed-example.sh
sh ./scripts/docker-liquidsoap.sh


cd modules/arching-kaos-api
./install.sh
cd ../..

cd modules/arching-kaos-radio
./start.sh
cd ../..

cd modules/docker-dat-store
sh ./build.sh
sh ./start.sh
cd ../..

