# Collection of Dockerfiles

This is a collection of [Dockerfiles](https://docs.docker.com/engine/reference/builder/) for generating [Docker](https://docs.docker.com/) images for various software packages. This collection favors lean images built on top of [Alpine Linux](http://alpinelinux.org/) or [Debian Linux](https://www.debian.org/) distributions due to their small footprint. Alpine has a `5MB` image while Debian has a `125MB` image. [Ubuntu Linux](http://www.ubuntu.com/), which is one of the most popular base distributions for Docker images, has a `188MB` image.

| Name | Description | Download Size | Image Size |
| --- | --- | --- | --- |
| [djnago](django)     | Dockerfile for [Django](https://www.djangoproject.com/) based on Alpine                   | [![](https://images.microbadger.com/badges/image/rvernica/django.svg)](https://microbadger.com/images/rvernica/django)     | `~70-120MB`  |
| [graphite](graphite) | Dockerfile for [Graphite Project](https://github.com/graphite-project) based on Alpine    | [![](https://images.microbadger.com/badges/image/rvernica/graphite.svg)](https://microbadger.com/images/rvernica/graphite) | `~140MB`     |
| [scidb](scidb)       | Dockerfiles for [SciDB DBMS](http://www.paradigm4.com/) based on Debian                   | [![](https://images.microbadger.com/badges/image/rvernica/scidb.svg)](https://microbadger.com/images/rvernica/scidb)       | `~400MB-2GB` |
| ~~vectror~~          | Discontinued, official image avalable [here](https://hub.docker.com/r/netflixoss/vector/) |                                                                                                                            |              |
