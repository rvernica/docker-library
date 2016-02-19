Graphite
========

*   Dockerfile for [Graphite Project](https://github.com/graphite-project)
*   Build on top of [Alpine](http://alpinelinux.org/) Linux
*   Uses graphite-web [branch](https://github.com/rvernica/graphite-web/tree/django-1.9-patch) ported to Django 1.9
*   Size: `~140MB` (`~100MB` in Alpine packages)

Usage
-----

This image is intended to be used behind an HTTP server like nginx. (See below for development mode.)

*   Pull image `docker pull rvernica/graphite` or build image `docker build -t graphite .`
*   Pull official [nginx image](https://hub.docker.com/_/nginx/) `docker pull nginx`
*   Create nginx configuration file, `nginx.conf`:

        http {
            server {
                location /static {
                    alias /opt/graphite/static;
                }
                location / {
                    proxy_pass http://graphite:8080;
                }
                ...
            }
            ...
        }
        ...
        
    An example is provided [here](https://github.com/rvernica/Dockerfile/blob/master/graphite/nginx.conf)

*   Start graphite container:

        docker run --name graphite \
            --publish 2003:2003 \
            rvernica/graphite

    On startup, a *superuser* is created for the grapite-web module with a randomly generated password. The credentials are printed on the screen:

        [graphite-web] Superuser: admin, Password: ...

    If you are starting the container with `--detach`, you can get the credentials by running `docker logs graphite`.  Port `8080` does not need to be published because the container is going to be linked to the nginx container below.
*   Start nginx container:

        docker run --name nginx --publish 80:80 \
            --link graphite:graphite --volumes-from graphite \
            --volume /some/nginx.conf:/etc/nginx/nginx.conf:ro \
            nginx

Additionally this image can also be used without any HTTP server in development mode:

    docker run --publish 2003:2003 --publish 8080:8080 \
        rvernica/graphite \
        /bin/ash -c "\
            /opt/graphite/bin/carbon-cache.py start && \
            PYTHONPATH=/opt/graphite/webapp DJANGO_SETTINGS_MODULE=graphite.settings python /usr/local/bin/post-setup-graphite-web.py --debug && \
            PYTHONPATH=/opt/graphite/whisper /opt/graphite/bin/run-graphite-devel-server.py --libs=/opt/graphite/webapp/ /opt/graphite/"

If you would like to use a URL prefix (e.g., `/graphite`), you need to set the `URL_PREFIX = '...'` variable in the `local_settings.py` (`/opt/graphite/webapp/graphite/local_settings.py`) file. This can be done in the [post-setup-graphite-web.py](https://github.com/rvernica/Dockerfile/blob/master/graphite/post-setup-graphite-web.py#L16) script before you build the image. See Graphite [documentation](http://graphite.readthedocs.org/en/latest/config-webapp.html) for additional details.
