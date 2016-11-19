# Django

* Dockerfile for [Django](https://www.djangoproject.com/)
* Build on top of [Alpine](http://alpinelinux.org/) Linux
* Size: `~70-120MB`
* Latest version: `1.10.3`
* Latest [Long-Term Support (LTS)](https://www.djangoproject.com/download/#supported-versions) version: `1.8.16`
* Automated builds at [Docker Hub](https://hub.docker.com/r/rvernica/django/) [![](https://images.microbadger.com/badges/version/rvernica/django.svg)](https://microbadger.com/images/rvernica/django)
* Continuous integration [![Build Status](https://travis-ci.org/rvernica/docker-library.svg?branch=master)](https://travis-ci.org/rvernica/docker-library)

# Tags

| Tag | Django | Python | Download Size | Image Size |
| --- | ---    | ---    | ---           | ---:        |
| [`django:python3`](https://github.com/rvernica/docker-library/blob/master/django/3.5/Dockerfile)                 | `1.10.3`         | `3.5` | [![](https://images.microbadger.com/badges/image/rvernica/django:python3.svg)](https://microbadger.com/images/rvernica/django:python3)                 | `116.8MB` |
| [`django:python3-onbuild`](https://github.com/rvernica/docker-library/blob/master/django/3.5/Dockerfile.onbuild) | `1.10.3` onbuild | `3.5` | [![](https://images.microbadger.com/badges/image/rvernica/django:python3-onbuild.svg)](https://microbadger.com/images/rvernica/django:python3-onbuild) | `84.6MB`  |
| [`django:python3-lts`](https://github.com/rvernica/docker-library/blob/master/django/3.5/Dockerfile.lts)         | `1.8.16` LTS     | `3.5` | [![](https://images.microbadger.com/badges/image/rvernica/django:python3-lts.svg)](https://microbadger.com/images/rvernica/django:python3-lts)         | `114.4MB` |
| [`django:python2`](https://github.com/rvernica/docker-library/blob/master/django/2.7/Dockerfile)                 | `1.10.3`         | `2.7` | [![](https://images.microbadger.com/badges/image/rvernica/django:python2.svg)](https://microbadger.com/images/rvernica/django:python2)                 | `104.5MB` |
| [`django:python2-onbuild`](https://github.com/rvernica/docker-library/blob/master/django/2.7/Dockerfile.onbuild) | `1.10.3` onbuild | `2.7` | [![](https://images.microbadger.com/badges/image/rvernica/django:python2-onbuild.svg)](https://microbadger.com/images/rvernica/django:python2-onbuild) | `72.5MB`  |
| [`django:python2-lts`](https://github.com/rvernica/docker-library/blob/master/django/2.7/Dockerfile.lts)         | `1.8.16` LTS     | `2.7` | [![](https://images.microbadger.com/badges/image/rvernica/django:python2-lts.svg)](https://microbadger.com/images/rvernica/django:python2-lts)         | `102.1MB` |

# What is Django?

Django is a free and open source web application framework, written in Python, which follows the model-view-controller architectural pattern. Django's primary goal is to ease the creation of complex, database-driven websites with an emphasis on reusability and "pluggability" of components.

> [wikipedia.org/wiki/Django_(web_framework)](https://en.wikipedia.org/wiki/Django_%28web_framework%29)

![Django logo](logo.png)

# How to use this image

## Create a `Dockerfile` in your Django app project

```dockerfile
FROM rvernica/django:onbuild
```

Put this file in the root of your app, next to the `requirements.txt`.

This image includes multiple `ONBUILD` triggers which should cover most applications. The build will `COPY . /usr/src/app`, `RUN pip install`, `EXPOSE 8000`, and set the default command to `python manage.py runserver`.

You can then build and run the Docker image:

```console
$ docker build --tag my-django-app .
$ docker run --name some-django-app --detach my-django-app
```

You can test it by visiting `http://container-ip:8000` in a browser or, if you need access outside the host, on `http://localhost:8000` with the following command:

```console
$ docker run --name some-django-app --publish 8000:8000 --detach my-django-app
```

## Without a `Dockerfile`

Of course, if you don't want to take advantage of magical and convenient `ONBUILD` triggers, you can always just use `docker run` directly to avoid having to add a `Dockerfile` to your project.

```console
$ docker run --name some-django-app --volume "$PWD":/usr/src/app --workdir /usr/src/app --publish 8000:8000 --detach rvernica/django bash -c "pip install -r requirements.txt && python manage.py runserver 0.0.0.0:8000"
```

## Bootstrap a new Django Application

If you want to generate the scaffolding for a new Django project, you can do the following:

```console
$ docker run --interactive --tty --rm --user "$(id -u):$(id -g)" --volume "$PWD":/usr/src/app --workdir /usr/src/app rvernica/django django-admin.py startproject mysite
```

This will create a sub-directory named `mysite` inside your current directory.

# About this image

This Docker library is a fork of the [Docker Official Image packaging for Django](https://github.com/docker-library/django). The official image is currently [deprecated](https://github.com/docker-library/docs/pull/630) and will receive [no further updates](https://hub.docker.com/_/django/) starting 2017.
