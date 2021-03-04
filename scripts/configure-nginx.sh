#!/bin/sh
sed -i.bak -e 's/{$API_SERVER_NAME}/api.arching-kaos.com/' etc/nginx/conf.d/api.conf
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.com/' etc/nginx/conf.d/api.conf
sed -i.bak -e 's/{$DOMAIN_NAME}/arching-kaos.com/' etc/nginx/conf.d/default.conf
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.com/' etc/nginx/conf.d/docs.conf
sed -i.bak -e 's/{$ICECAST_SERVER_NAME}/icecast.arching-kaos.com/' etc/nginx/conf.d/icecast.conf
sed -i.bak -e 's/{$IPFS_SERVER_NAME}/ipfs.arching-kaos.com/' etc/nginx/conf.d/ipfs-gateway.conf
sed -i.bak -e 's/{$IRC_SERVER_NAME}/irc.arching-kaos.com/' etc/nginx/conf.d/irc.conf
sed -i.bak -e 's/{$IRC_CLIENT}//' etc/nginx/conf.d/irc.conf
sed -i.bak -e 's/{$RADIO_SERVER_NAME}/radio.arching-kaos.com/' etc/nginx/conf.d/radio-arching.conf
sed -i.bak -e 's/{$SSB_SERVER_NAME}/ssb.arching-kaos.com/' etc/nginx/conf.d/ssb.conf
sed -i.bak -e 's/{$TRACKER_SERVER_NAME}/tracker.arching-kaos.com/' etc/nginx/conf.d/tracker.conf
