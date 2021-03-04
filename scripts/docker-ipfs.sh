#!/bin/sh
docker run -d --name ipfs -v {$ARCHING_KAOS_BASE_DIR}/storage/ipfs/export:/export -v {$ARCHING_KAOS_BASE_DIR}/storage/ipfs/data:/data/ipfs -p 4001:4001 -p 127.0.0.1:8080:8080 -p 127.0.0.1:5001:5001 ipfs/go-ipfs:latest
