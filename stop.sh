#!/bin/sh
echo "Stopping containers and pod..."
podman stop api docs icecast ipfs sbot opentracker liquidsoap arching-kaos-radio irc-server healer nginx thelounge
podman pod stop arching-kaos
echo "Warning: Removing containers..."
podman container rm api docs icecast ipfs sbot opentracker liquidsoap arching-kaos-radio irc-server healer nginx thelounge
#podman container prune -f
echo "Removing pod..."
podman pod rm arching-kaos

