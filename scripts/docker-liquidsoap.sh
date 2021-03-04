#!/bin/sh
docker run -d --rm --name liquidsoap --restart always -v {$ARCHING_KAOS_BASE_DIR}/etc/liquidsoap/radio.liq:/etc/liquidsoap/script.liq -v {$ARCHING_KAOS_BASE_DIR}/storage/radio:/radio pltnk/liquidsoap
