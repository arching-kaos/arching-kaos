#!/bin/sh
docker run -d --name ipfs -v {$ARCHING_KAOS_BASE_DIR}/ipfs/export:/export -v {$ARCHING_KAOS_BASE_DIR}/ipfs/data:/data/ipfs -p 4001:4001 -p 127.0.0.1:8080:8080 -p 127.0.0.1:5001:5001 ipfs/go-ipfs:latest
