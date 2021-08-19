#!/bin/sh
podman run --pod arching-kaos -d --name liquidsoap --restart always -v $PWD/etc/liquidsoap/radio.liq:/etc/liquidsoap/script.liq -v $PWD/storage:/radio docker.io/pltnk/liquidsoap
