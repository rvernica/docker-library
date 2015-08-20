vector
======

*   Dockerfile for [Neflix/vector](https://github.com/Netflix/vector)
*   Build on top of [Alpine](http://alpinelinux.org/) Linux
*   Uses Bintray Vector [release](https://bintray.com/netflixoss/downloads/vector/view)
*   Size: `~10MB`

Usage
-----

This container is intended to be used as a [data volume](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container) container and mounted from a [nginx](http://nginx.org/) container.

*   Build image: `docker build -t vector .`
*   Create data volume container:

        docker create --name vector --volume /usr/local/vector vector /bin/true

*   Pull [nginx image](https://hub.docker.com/_/nginx/): `docker pull nginx`
*   Create nginx configuration file, `nginx.conf`:

        http {
            server {
                location /vector {
                    alias /usr/local/vector;
                }
                ...
            }
            ...
        }
        ...
        
*   Start nginx container:

        docker run --name nginx \
            --volumes-from vector \
            --volume /some/nginx.conf:/etc/nginx/nginx.conf:ro \
            nginx

Other HTTP servers could be used as well.
