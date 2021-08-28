#!/bin/sh
podman run --pod arching-kaos --name icecast -d --restart always localhost/icecast
