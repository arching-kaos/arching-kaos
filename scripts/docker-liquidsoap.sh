#!/bin/sh
docker run -d --name liquidsoap --restart always -v $PWD/etc/liquidsoap/radio.liq:/etc/liquidsoap/script.liq -v $PWD/storage:/radio pltnk/liquidsoap
