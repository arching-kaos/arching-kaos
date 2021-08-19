#!/bin/bash
echo "Running sbot..."
podman run --pod arching-kaos -d --name sbot \
   -v $PWD/etc/ssb-pub-data/:/home/node/.ssb/ \
   -p 8008:8008 \
   -p 8989:8989 \
   --memory 800m \
   docker.io/ahdinosaur/ssb-pub
echo "... done"
echo "Running healer..."
podman run --pod arching-kaos -d --name healer \
 docker.io/ahdinosaur/healer
echo "... done"
