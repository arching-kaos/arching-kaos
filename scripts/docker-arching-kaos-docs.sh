#!/bin/sh
docker run --name docs -d -p 3002:3000 -v {$ARCHING_KAOS_BASE_DIR}/docs:/usr/local/docsify littlstar/docker-docsify --rm
