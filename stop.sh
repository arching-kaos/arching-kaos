#!/bin/sh
docker stop api docs icecast ipfs sbot opentracker liquidsoap arching-kaos-radio dat-store healer nginx
docker container prune -f
