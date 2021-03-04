#!/bin/sh
docker run --name icecast -d --rm --restart always -p 8000:8000 -v {$ARCHING_KAOS_BASE_DIR}/etc/icecast2/icecast.xml:/etc/icecast2/icecast.xml moul/icecast
