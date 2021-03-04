#!/bin/sh
sed -i.bak -e 's/{$IRC_NAME}/irc.arching-kaos.net/' ircd.conf
sed -i.bak -e 's/{$IRC_SID}/44Q/' ircd.conf
sed -i.bak -e 's/{$IRC_DESCRIPTION}/A friendly IRC server/' ircd.conf
sed -i.bak -e 's/{$IRC_NETNAME}/irc.arching-kaos.net/' ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV4}/127.0.0.1/' ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/' ircd.conf
sed -i.bak -e 's/{$CJDNS_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/' ircd.conf
sed -i.bak -e 's/{$ADMIN NAME}/kaotisk/' ircd.conf
sed -i.bak -e 's/{$ADMIN_DESCRIPTION}/some descr/' ircd.conf
sed -i.bak -e 's/{$ADMIN_EMAIL}/kaotisk@arching-kaos.com/' ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV4}/127.0.0.1/' ircd.conf
sed -i.bak -e 's/{$PUBLIC_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/' ircd.conf
sed -i.bak -e 's/{$CJDNS_IPV6}/fc42:7cfa:b830:e988:f192:717f:6576:ed12/' ircd.conf
sed -i.bak -e 's/{$IRC_AUTH_PASSWORD}/somepass/' ircd.conf
sed -i.bak -e 's/{$GOD_IRC_PASSWORD}/somepass/' ircd.conf
