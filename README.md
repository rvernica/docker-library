# Collection of Dockerfiles

This is a collection of [Dockerfiles](https://docs.docker.com/engine/reference/builder/) for generating [Docker](https://docs.docker.com/) images for various software packages. This collection favors lean images built on top of [Alpine Linux](http://alpinelinux.org/) or [Debian Linux](https://www.debian.org/) distributions due to their small footprint. Alpine has a `5MB` image while Debian has a `125MB` image. [Ubuntu Linux](http://www.ubuntu.com/) which is one of the most popular base images for Docker is `188MB`.

   * [Django](https://www.djangoproject.com/) Dockerfile based on Alpine: [djnago](django) - moved to official Django image [fork](https://github.com/rvernica/docker-django)
   * [Graphite Project](https://github.com/graphite-project) Dockerfile based on Alpine: [graphite](graphite) (`~140MB`)
   * [SciDB DBMS](http://www.paradigm4.com/) Dockerfiles based on Debian: [scidb](scidb)
   * [Vector](http://vectoross.io/) Dockerfile based on Alpine: [vectror](vector) (`~10MB`)
