#!/bin/sh
mkdir -p $PWD/storage/ipfs/export
mkdir -p $PWD/storage/ipfs/data
podman run --pod arching-kaos -d --restart always --name ipfs -v $PWD/storage/ipfs/export:/export -v $PWD/storage/ipfs/data:/data/ipfs docker.io/ipfs/go-ipfs:latest
