#!/bin/sh
docker run --network=host \
        --name thelounge \
        --volume $PWD/etc/thelounge:/var/opt/thelounge \
        --restart always \
        thelounge/thelounge:latest
