FROM alpine:3.4

ENV DJANGO_VERSION 1.8.16

RUN apk add --update-cache \
            bash py-pip \
            mariadb-libs libpq sqlite && \
    apk add --virtual=build-deps \
            gcc musl-dev python-dev \
            mariadb-dev postgresql-dev && \
    pip install mysqlclient \
                psycopg2 \
                django=="$DJANGO_VERSION" && \
    apk del build-deps && rm -rf /var/cache/apk/*
