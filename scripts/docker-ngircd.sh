#!/bin/bash
podman run -dt --name irc-server --pod arching-kaos -v $PWD/etc/ngircd:/etc/ngircd:Z docker.io/geekduck/ngircd
