#!/bin/sh
mkdir -p $PWD/storage/ipfs/export
mkdir -p $PWD/storage/ipfs/data
podman run --pod arching-kaos -d --restart always --name ipfs -v $PWD/storage/ipfs/export:/export:Z -v $PWD/storage/ipfs/data:/data/ipfs:Z docker.io/ipfs/go-ipfs:latest
