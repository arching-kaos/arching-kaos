#!/bin/sh
docker run -d --restart always --name ipfs -v $PWD/storage/ipfs/export:/export -v $PWD/storage/ipfs/data:/data/ipfs -p 4001:4001 -p 127.0.0.1:8080:8080 -p 127.0.0.1:5001:5001 ipfs/go-ipfs:latest
