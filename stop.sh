#!/bin/sh
podman stop api docs icecast ipfs sbot opentracker liquidsoap arching-kaos-radio dat-store healer nginx thelounge
echo "Warning: going to remove all stop containers now!"
podman container prune -f
