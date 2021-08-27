#!/bin/sh
podman run --pod arching-kaos --name docs --restart always -d -v $PWD/docs:/usr/local/docsify:Z docker.io/littlstar/docker-docsify
