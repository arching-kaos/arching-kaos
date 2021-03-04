#!/bin/sh
docker run --name docs --restart always -d -p 3002:3000 -v $PWD/docs:/usr/local/docsify littlstar/docker-docsify
