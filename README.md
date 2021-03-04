# arching-kaos

## Documentation

Documentation can be found on `/docs/`

Can be launched with docker too

`./scripts/docker-arching-kaos-docs.sh`

## Components

### TORRENT-TRACKER
> This is for future use.

Docker with opentracker
`./scripts/docker-opentracker.sh`

### IRC
> Charybdis IRC daemon.

Static files:
- `./etc/charybdis/ircd.conf`
- `./etc/charybdis/ircd.conf-backup`
- `./etc/charybdis/ircd.motd`

Scripts:
- `./scripts/charybdis-fedora-install.sh`

Source:
- `git.arching-kaos.net/kaotisk/charybdis.git`

### WEB SERVER
> nginx web server

Configuration is done with:
- `./scripts/configure-nginx.sh`

Either mount on docker or copy this folder:
- `/etc/nginx/conf.d/`

### STREAM SERVER

icecast2

`/etc/icecast2/icecast.xml`

Docker

`/scripts/docker-icecast.sh`


### PLAYER

liquidsoap

`/etc/liquidsoap/radio.liq`



## Storage

### FS

`/storage`

### Torrent

### IPFS

`/storage/ipfs`

#### Docker

`scripts/docker-ipfs.sh`

### Dat

`/storage/dat`

`scripts/run-dat-gateway.sh`

`scripts/run-dat.sh`

#### Docker submodule

`modules/docker-dat-store`

## Tools, scripts

### Generate playlist

`scripts/gen-playlist.sh`

### Configuration

#### Environment tools

"grep"s the variables of the project

`scripts/grep-env.sh`

Supposingly we are going to use this to render all the configuration through it

`scripts/sed-example.sh`

Example is for rendering {$LOCATION} variable to "earth".

#### CJDNS tools

Strip comments from cjdroute configuration

`scripts/cjdroute-strip-comment.sh`


