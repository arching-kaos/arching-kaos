#!/bin/bash
podman run -dt --name irc-server --pod arching-kaos -v $PWD/etc/ngircd/ngircd.conf:/etc/ngircd/ngircd.conf -v $PWD/etc/ngircd/ngircd.motd:/etc/ngircd/ngircd.motd docker.io/geekduck/ngircd
