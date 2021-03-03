#!/bin/bash
docker run -d --name sbot \
   -v {$ARCHING_KAOS_BASE_DIR}/etc/ssb-pub-data/:/home/node/.ssb/ \
   -p 8008:8008 \
   -p 8989:8989 \
   --restart unless-stopped \
   --memory 800m \
   ahdinosaur/ssb-pub
