#!/bin/sh
podman run --pod arching-kaos -d --network=host \
        --name thelounge \
        --volume $PWD/etc/thelounge:/var/opt/thelounge \
        --restart always \
	docker.io/thelounge/thelounge:latest
