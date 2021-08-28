#!/bin/sh
podman run --pod arching-kaos -d --name liquidsoap --restart always -v $PWD/etc/liquidsoap/radio.liq:/etc/liquidsoap/script.liq:Z -v $PWD/storage:/radio:Z docker.io/pltnk/liquidsoap
