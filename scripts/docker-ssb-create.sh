#!/bin/bash
echo "Running sbot..."
podman run -d --name sbot \
   -v $PWD/etc/ssb-pub-data/:/home/node/.ssb/ \
   -p 8008:8008 \
   -p 8989:8989 \
   --restart unless-stopped \
   --memory 800m \
   docker.io/ahdinosaur/ssb-pub
echo "... done"
echo "Running healer..."
podman run -d --name healer \
# -v /var/run/docker.sock:/tmp/docker.sock \
 --restart unless-stopped \
 docker.io/ahdinosaur/healer
echo "... done"
