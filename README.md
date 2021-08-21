# arching-kaos

[![Build Status](https://api.travis-ci.org/kaotisk-hund/arching-kaos.svg?branch=master)](https://travis-ci.org/kaotisk-hund/arching-kaos)

## Documentation

Documentation can be found on `/docs/`

Can be launched with docker too

`./scripts/docker-arching-kaos-docs.sh`

## Simple install

Clone the repository using git:

`git clone https://git.arching-kaos.net/kaotisk/arching-kaos.git`

Change into that directory:

`cd arching-kaos`

and run

`./install`

## Components

### Torrent tracker
> This is for future use.

- [x] Simple install

Docker with opentracker
`./scripts/docker-opentracker.sh`

### IRC
> Next Generation IRC daemon.

- [x] Simple install

Static files:
- `./etc/ngircd/ngircd.conf`
- `./etc/ngircd/ngircd.motd`

Scripts:
- `./scripts/configure-ngircd.sh`
- `./scripts/docker-ngircd.sh`

### Web server
> nginx web server

- [x] Simple install

Configuration is done with:
- `./scripts/configure-nginx.sh`

Either mount on docker or copy this folder:
- `./etc/nginx/conf.d/`

### Stream server
> icecast2

- [x] Simple install

Static files:
- `./etc/icecast2/icecast.xml`

Scripts:
- `./scripts/docker-icecast.sh`

### Player
> liquidsoap

- [x] Simple install

Static files:
- `./etc/liquidsoap/radio.liq`

Scripts:
- `./scripts/docker-liquidsoap.sh`

## Storage

### FS
> Generic storage folder

Theoritical volume:
- `./storage`

### Torrent

We store no torrents. Future release.

### IPFS

- [x] Simple install

Mount location:
- `./storage/ipfs`

Scripts
- `./scripts/docker-ipfs.sh`

### SSB

- [x] Simple install

Static files:
- `./etc/ssb-pub-data`

Scripts:
- `./scripts/docker-ssb-create.sh`

## Tools, scripts
> Collection of tools and scripts

### Generate playlist

`./scripts/gen-playlist.sh`

### Experimental stuff

#### Environment tools

"grep"s the variables of the project

`scripts/grep-env.sh`

Supposingly we are going to use this to render all the configuration through it

`scripts/sed-example.sh`

Example is for rendering {$LOCATION} variable to "earth".

#### CJDNS tools

Strip comments from cjdroute configuration

`scripts/cjdroute-strip-comment.sh`
