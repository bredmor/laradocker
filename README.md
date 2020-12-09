# Laradocker
[![Build Status](https://img.shields.io/docker/cloud/build/bredmorg/laradocker?style=flat-square)](https://hub.docker.com/repository/docker/bredmorg/laradocker) ![Docker Pulls](https://img.shields.io/docker/pulls/bredmorg/laradocker?style=flat-square)

Docker image for Laravel & Laravel Vapor CLI

If you want to run dockerized Laravel locally, consider using [Laravel Sail](https://laravel.com/docs/8.x/sail) instead.


# Latest Stable Version
Docker tag `latest` will always reflect the current state of [master](https://github.com/bredmor/laradocker/tree/master). It is recommended to specify one of the tags below when using this image so as to avoid any unexpected issues. 

All image tags on docker hub correspond to the same tag in this repository.

# Newest Major Versions
See [Releases](https://github.com/bredmor/laradocker/releases) for complete version history.

## v3.1
- Base Image: Ubuntu@latest
- PHP: `8.0`
- Node: `14`

## v3.0.1
- Base Image: Ubuntu@latest
- PHP: `8.0`
- Node: `12`

## v2.2
- Base Image: Ubuntu@latest
- PHP: `7.4`
- Node: `14`

## v1.0
- Base Image: Ubuntu@latest
- PHP: `7.3`
- Node: `12`

# Software Versions
**PHP** Will always be the newest available patch version for Ubuntu from [Ondřej Surý's PPA](https://launchpad.net/~ondrej/+archive/ubuntu/php). New minor and major versions will be tagged as new major versions of this image.

**Node.JS** Will always be the newest available minor and patch *LTS* version from [Nodesource](https://downloads.nodesource.com/#debian). New major versions will be tagged as new major versions of this image.

**Composer** Will always be the newest available version until such time that a composer release does not support PHP 7.3 (laradocker v1.0)

# Contributions, Issues and Requests
I monitor this repo daily and will respond to open Issues and Pull Requests. You can also shout out to me on [Twitter](https://twitter.com/bredmor) for a quicker response.
