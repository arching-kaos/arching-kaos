#!/bin/sh
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' icecast.xml
sed -i.bak -e 's/{$ICECAST_RELAY_PASSWORD}/hackme/' icecast.xml
sed -i.bak -e 's/{$ICECAST_ADMIN_PASSWORD}/hackme/' icecast.xml
sed -i.bak -e 's/{$ICECAST_HOSTNAME}/icecast.arching-kaos.com/' icecast.xml
sed -i.bak -e 's/{$RADIO_WEBSITE_BASEURL}/http://radio.arching-kaos.com/' icecast.xml

# Optional
#sed -i.bak -e 's/{$ICECAST_PEER_IP}' icecast.xml
#sed -i.bak -e 's/{$ICECAST_PEER_PORT}' icecast.xml
#sed -i.bak -e 's/{$ICECAST_PEER_MOUNT}' icecast.xml
#sed -i.bak -e 's/{$ICECAST_RELAY_MOUNT}' icecast.xml
