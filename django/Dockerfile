FROM alpine:3.2

RUN apk add --update build-base python-dev postgresql-dev mariadb-dev sqlite py-pip && \
	rm -rf /var/cache/apk/*
	
ENV DJANGO_VERSION 1.8.4
RUN pip install --upgrade pip && pip install mysqlclient psycopg2 django=="$DJANGO_VERSION"
