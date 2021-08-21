#!/bin/sh
podman run --pod arching-kaos -d --restart always --name opentracker docker.io/lednerb/opentracker-docker
