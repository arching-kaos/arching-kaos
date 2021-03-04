#!/bin/sh
sed -i.bak -e 's/{$API_SERVER_NAME}/api.arching-kaos.com/' etc/nginx/sites-enabled/api
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.com/' etc/nginx/sites-enabled/api
sed -i.bak -e 's/{$DOMAIN_NAME}/arching-kaos.com/' etc/nginx/sites-enabled/default
sed -i.bak -e 's/{$DOCS_SERVER_NAME}/docs.arching-kaos.com/' etc/nginx/sites-enabled/docs
sed -i.bak -e 's/{$ICECAST_SERVER_NAME}/icecast.arching-kaos.com/' etc/nginx/sites-enabled/icecast
sed -i.bak -e 's/{$IPFS_SERVER_NAME}/ipfs.arching-kaos.com/' etc/nginx/sites-enabled/ipfs-gateway
sed -i.bak -e 's/{$IRC_SERVER_NAME}/irc.arching-kaos.com/' etc/nginx/sites-enabled/irc
sed -i.bak -e 's/{$IRC_CLIENT}//' etc/nginx/sites-enabled/irc
sed -i.bak -e 's/{$RADIO_SERVER_NAME}/radio.arching-kaos.com/' etc/nginx/sites-enabled/radio-arching
sed -i.bak -e 's/{$SSB_SERVER_NAME}/ssb.arching-kaos.com/' etc/nginx/sites-enabled/ssb
sed -i.bak -e 's/{$TRACKER_SERVER_NAME}/tracker.arching-kaos.com/' etc/nginx/sites-enabled/tracker
