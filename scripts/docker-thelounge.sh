#!/bin/sh
podman run --pod arching-kaos -d \
        --name thelounge \
        --volume $PWD/etc/thelounge:/var/opt/thelounge:Z \
        --restart always \
	docker.io/thelounge/thelounge:latest
