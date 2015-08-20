FROM alpine:3.2

RUN apk add --update wget ca-certificates && rm -rf /var/cache/apk/*
RUN mkdir /usr/local/vector && \
    cd /usr/local/vector && \
    wget --output-document=- https://bintray.com/artifact/download/netflixoss/downloads/1.0.1/vector.tar.gz \
    | tar zxf -
