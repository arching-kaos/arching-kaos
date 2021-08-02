#!/bin/sh
podman run --name icecast -d --restart always -p 8000:8000 -v $PWD/etc/icecast2/icecast.xml:/etc/icecast2/icecast.xml docker.io/moul/icecast
