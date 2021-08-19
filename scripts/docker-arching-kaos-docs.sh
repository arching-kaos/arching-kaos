#!/bin/sh
podman run --pod arching-kaos --name docs --restart always -d -p 3002:3000 -v $PWD/docs:/usr/local/docsify docker.io/littlstar/docker-docsify
