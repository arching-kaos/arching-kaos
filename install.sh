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
git submodule init docker-dat-store
git submodule update docker-dat-store
echo "Done!"
cd ..
echo "Configuring /etc ..."
echo "...1/4 charybdis"
sed -i.bak -e 's/{$IRC_NAME}/irc.arching-kaos.net/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_SID}/44Q/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_DESCRIPTION}/A friendly IRC server/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_NETNAME}/irc.arching-kaos.net/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV4}/127.0.0.1/g' etc/charybdis/ircd.conf
#sed -i.bak -e 's/{$PUBLIC_IPV6}//g' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$CJDNS_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/g' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN NAME}/kaotisk/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN_DESCRIPTION}/some descr/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$IRC_AUTH_PASSWORD}/somepass/' etc/charybdis/ircd.conf
sed -i.bak -e 's/{$GOD_IRC_PASSWORD}/somepass/' etc/charybdis/ircd.conf
echo "...2/4 icecast"
sed -i.bak -e 's/{$LOCATION}/earth/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_RELAY_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_ADMIN_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_HOSTNAME}/icecast.arching-kaos.local/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$RADIO_WEBSITE_BASEURL}/http:\/\/radio.arching-kaos.local/' etc/icecast2/icecast.xml
echo "...3/4 liquidsoap"
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/liquidsoap/radio.liq
sed -i.bak -e 's/{$LIVE_SOURCE_PASSWORD}/hackmetoo/' etc/liquidsoap/radio.liq
echo "...4/4 nginx"
sed -i.bak -e 's/{$API_SERVER_NAME}/api.arching-kaos.local/g' etc/nginx/conf.d/api.conf modules/arching-kaos-radio/src/ShowList.js modules/arching-kaos-radio/src/Menu.js
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.local/g' etc/nginx/conf.d/api.conf etc/nginx/conf.d/docs.conf
sed -i.bak -e 's/{$DOMAIN_NAME}/arching-kaos.local/g' etc/nginx/conf.d/default.conf modules/arching-kaos-radio/src/Signature.js
sed -i.bak -e 's/{$ICECAST_SERVER_NAME}/icecast.arching-kaos.local/g' etc/nginx/conf.d/icecast.conf modules/arching-kaos-radio/src/App.js modules/arching-kaos-radio/src/Menu.js modules/arching-kaos-radio/src/NowPlaying.js
sed -i.bak -e 's/{$IPFS_SERVER_NAME}/ipfs.arching-kaos.local/g' etc/nginx/conf.d/ipfs-gateway.conf modules/arching-kaos-api/config.js
sed -i.bak -e 's/{$IRC_SERVER_NAME}/irc.arching-kaos.local/g' etc/nginx/conf.d/irc.conf etc/thelounge/config.js
sed -i.bak -e 's/{$IRC_CLIENT}/http:\/\/127.0.0.1:9000/g' modules/arching-kaos-radio/src/Chat.js modules/arching-kaos-irc/index.html
sed -i.bak -e 's/{$RADIO_SERVER_NAME}/radio.arching-kaos.local/g' etc/nginx/conf.d/radio-arching.conf modules/arching-kaos-radio/src/Header.js
sed -i.bak -e 's/{$SSB_SERVER_NAME}/ssb.arching-kaos.local/g' etc/nginx/conf.d/ssb.conf etc/ssb-pub-data/config
sed -i.bak -e 's/{$TRACKER_SERVER_NAME}/tracker.arching-kaos.local/' etc/nginx/conf.d/tracker.conf
echo "Create API directories"
# sh ./modules/arching-kaos-api/api-dir.sh # Going the custom way again
export ARCHING_KAOS_API_DIR=$PWD/storage/.arching-kaos-api
mkdir -p $ARCHING_KAOS_API_DIR/downloads
cp modules/arching-kaos-api/ipList.json-sample $ARCHING_KAOS_API_DIR/ipList.json
cp modules/arching-kaos-api/shows.json-sample $ARCHING_KAOS_API_DIR/shows.json
echo "Getting docker scripts ready ..."
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
echo "Starting dat-store..."
cd modules/docker-dat-store
sh ./build.sh
sh ./start.sh
echo "... done"
cd ../..
echo "Starting thelounge..."
sh ./scripts/docker-thelounge.sh
echo "... done"
echo "Setting up IRC"
sh ./scripts/charybdis-simple-install.sh
cp etc/charybdis/ircd.conf $HOME/ircd/etc/ircd.conf
cp etc/charybdis/ircd.motd $HOME/ircd/etc/ircd.motd
echo "Starting IRC..."
$HOME/ircd/bin/charybdis
## TODO Insert crontab @reboot
echo "Starting NGINX..."
docker run --name nginx --restart always -d --network=host -v $PWD/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/modules/arching-kaos-generic:/srv/generic -v $PWD/modules/arching-kaos-irc:/srv/irc -v $PWD/modules/arching-kaos-ssb:/srv/ssb nginx
echo "Voila!"
