#!/bin/sh
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_SOURCE_PASSWORD}/hackme/' etc/liquidsoap/radio.liq
sed -i.bak -e 's/{$ICECAST_RELAY_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_ADMIN_PASSWORD}/hackme/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$ICECAST_HOSTNAME}/icecast.arching-kaos.com/' etc/icecast2/icecast.xml
sed -i.bak -e 's/{$RADIO_WEBSITE_BASEURL}/http://radio.arching-kaos.com/' etc/icecast2/icecast.xml

# Optional
#sed -i.bak -e 's/{$ICECAST_PEER_IP}' etc/icecast2/icecast.xml
#sed -i.bak -e 's/{$ICECAST_PEER_PORT}' etc/icecast2/icecast.xml
#sed -i.bak -e 's/{$ICECAST_PEER_MOUNT}' etc/icecast2/icecast.xml
#sed -i.bak -e 's/{$ICECAST_RELAY_MOUNT}' etc/icecast2/icecast.xml
