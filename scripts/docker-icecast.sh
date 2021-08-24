#!/bin/sh
podman run --pod arching-kaos --name icecast -d --restart always -v $PWD/etc/icecast2/icecast.xml:/etc/icecast2/icecast.xml docker.io/infiniteproject/icecast
