#!/bin/sh
echo "Getting the basics done..."
echo "Initializing and updating modules..."
cd modules
git submodule init arching-kaos-api
git submodule update arching-kaos-api
git submodule init arching-kaos-radio
git submodule update arching-kaos-radio
git submodule init arching-kaos-generic
git submodule update arching-kaos-generic
git submodule init arching-kaos-ssb
git submodule update arching-kaos-ssb
git submodule init arching-kaos-irc
git submodule update arching-kaos-irc
echo "Done!"
cd ..
echo "Configuring /etc ..."
echo "...1/4 ngircd"
sh scripts/configure-ngircd.sh
echo "...2/4 icecast"
sed -i.bak -e 's/{$LOCATION}/earth/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_RELAY_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_ADMIN_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_HOSTNAME}/icecast.arching-kaos.local/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$RADIO_WEBSITE_BASEURL}/http:\/\/radio.arching-kaos.local/' etc/icecast2/icecast.xml
cp etc/icecast2/icecast.xml images/icecast/icecast.xml
cd images/icecast
sh build.sh
cd ../..
echo "...3/4 liquidsoap"
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/liquidsoap/radio.liq
sed -i.bak -e 's/{$LIVE_SOURCE_PASSWORD}/hackmetoo/' etc/liquidsoap/radio.liq
echo "...4/4 nginx"
sed -i.bak -e 's/{$API_SERVER_NAME}/api.arching-kaos.local/g' etc/nginx/conf.d/api.conf modules/arching-kaos-radio/src/ShowList.js modules/arching-kaos-radio/src/Menu.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.local/g' etc/nginx/conf.d/api.conf etc/nginx/conf.d/docs.conf modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$DOMAIN_NAME}/arching-kaos.local/g' etc/nginx/conf.d/default.conf modules/arching-kaos-radio/src/Signature.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$ICECAST_SERVER_NAME}/icecast.arching-kaos.local/g' etc/nginx/conf.d/icecast.conf modules/arching-kaos-radio/src/App.js modules/arching-kaos-radio/src/Menu.js modules/arching-kaos-radio/src/NowPlaying.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$IPFS_SERVER_NAME}/ipfs.arching-kaos.local/g' etc/nginx/conf.d/ipfs-gateway.conf modules/arching-kaos-api/config.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$IRC_SERVER_NAME}/irc.arching-kaos.local/g' etc/nginx/conf.d/irc.conf etc/thelounge/config.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$IRC_CLIENT}/http:\/\/127.0.0.1:9000/g' etc/nginx/conf.d/irc.conf # modules/arching-kaos-radio/src/Chat.js modules/arching-kaos-irc/index.html
sed -i.bak -e 's/{$IRC_CLIENT}/http:\/\/irc.arching-kaos.local/g' modules/arching-kaos-radio/src/Chat.js modules/arching-kaos-irc/index.html modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$RADIO_SERVER_NAME}/radio.arching-kaos.local/g' etc/nginx/conf.d/radio-arching.conf modules/arching-kaos-radio/src/Header.js modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$SSB_SERVER_NAME}/ssb.arching-kaos.local/g' etc/nginx/conf.d/ssb.conf etc/ssb-pub-data/config modules/arching-kaos-generic/generic.html
sed -i.bak -e 's/{$TRACKER_SERVER_NAME}/tracker.arching-kaos.local/' etc/nginx/conf.d/tracker.conf modules/arching-kaos-generic/generic.html
echo "Building nginx image..."
cd images/nginx
sh build.sh
cd ../..
echo "... done"
echo "Create API directories"
# sh ./modules/arching-kaos-api/api-dir.sh # Going the custom way again
export ARCHING_KAOS_API_DIR=$PWD/storage/.arching-kaos-api
mkdir -p $ARCHING_KAOS_API_DIR/downloads
cp modules/arching-kaos-api/ipList.json-sample $ARCHING_KAOS_API_DIR/ipList.json
cp modules/arching-kaos-api/shows.json-sample $ARCHING_KAOS_API_DIR/shows.json
echo "Getting podman scripts ready ..."
echo "Creating a pod for arching-kaos ..."
podman pod create --name arching-kaos -p 6667:6667 -p 9000:9000 -p 8081:80 -p 8000:8000 -p 8080:8080 -p 4001:4001 -p 8001:8001 -p 5001:5001 -p 8008:8008 -p 8989:8989 -p 6969:6969 -p 5000:5000 -p 3000:3000
echo "Proceeding arching-kaos installation ..."
echo "Starting docs..."
sh ./scripts/docker-arching-kaos-docs.sh
echo "... done"
echo "Starting icecast..."
sh ./scripts/docker-icecast.sh
echo "... done"
echo "Starting ipfs..."
sh ./scripts/docker-ipfs.sh
echo "... done"
echo "Starting opentracker..."
sh ./scripts/docker-opentracker.sh
echo "... done"
echo "Starting ssb..."
sh ./scripts/docker-ssb-create.sh
echo "... done"
echo "Starting liquidsoap..."
sh ./scripts/docker-liquidsoap.sh
echo "... done"
echo "Starting API..."
cd modules/arching-kaos-api
sh ./install.sh
cd ../..
sh ./modules/arching-kaos-api/run.sh
echo "... done"
echo "Starting webpage..."
cd modules/arching-kaos-radio
./start.sh
echo "... done"
cd ../..
echo "Starting thelounge..."
sh ./scripts/docker-thelounge.sh
echo "... done"
echo "Setting up and running IRC"
sh ./scripts/docker-ngircd.sh
## TODO Insert crontab @reboot
echo "Starting NGINX..."
podman run --pod arching-kaos --name nginx --restart always -d --network=host -v $PWD/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/modules/arching-kaos-generic:/srv/generic -v $PWD/modules/arching-kaos-irc:/srv/irc -v $PWD/modules/arching-kaos-ssb:/srv/ssb nginx
echo "Voila!"
