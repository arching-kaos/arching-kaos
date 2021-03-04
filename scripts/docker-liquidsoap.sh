#!/bin/sh
docker run -d --name liquidsoap --restart always -v {$ARCHING_KAOS_BASE_DIR}/etc/liquidsoap/radio.liq:/etc/liquidsoap/script.liq -v {$ARCHING_KAOS_BASE_DIR}/radio:/music pltnk/liquidsoap
