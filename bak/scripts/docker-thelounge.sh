#!/bin/sh
podman run -d --network=host \
        --name thelounge \
        --volume $PWD/etc/thelounge:/var/opt/thelounge \
        --restart always \
	docker.io/thelounge/thelounge:latest
