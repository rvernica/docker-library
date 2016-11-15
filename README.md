# Collection of Dockerfiles

This is a collection of [Dockerfiles](https://docs.docker.com/engine/reference/builder/) for generating [Docker](https://docs.docker.com/) images for various software packages. This collection favors lean images built on top of [Alpine Linux](http://alpinelinux.org/) or [Debian Linux](https://www.debian.org/) distributions due to their small footprint. Alpine has a `5MB` image while Debian has a `125MB` image. [Ubuntu Linux](http://www.ubuntu.com/) which is one of the most popular base images for Docker is `188MB`.

   * [djnago](django) - Dockerfile for [Django](https://www.djangoproject.com/) based on Alpine
   * [graphite](graphite) - Dockerfile for [Graphite Project](https://github.com/graphite-project) based on Alpine (`~140MB`)
   * [scidb](scidb) - Dockerfiles for [SciDB DBMS](http://www.paradigm4.com/) based on Debian (`~600MB-2GB`)
   * [vectror](vector) - Dockerfile for [Vector](http://vectoross.io/) based on Alpine (`~10MB`)
