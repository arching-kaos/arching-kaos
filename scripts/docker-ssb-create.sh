#!/bin/bash
echo "Running sbot..."
podman run --pod arching-kaos -d --name sbot --restart always -v $PWD/etc/ssb-pub-data/:/root/.ssb/:Z --memory 800m ssb
echo "... done"
echo "Running healer..."
podman run --pod arching-kaos -d --name healer docker.io/ahdinosaur/healer
echo "... done"
