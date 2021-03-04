#!/bin/sh
echo "Getting the basics done..."

sh ./scripts/configure-charybdis.sh
sh ./scripts/configure-icecast.sh
sh ./scripts/configure-liquidsoap.sh
sh ./scripts/configure-nginx.sh
