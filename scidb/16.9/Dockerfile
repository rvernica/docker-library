FROM rvernica/scidb:16.9-pre


## Build SciDB (leftover)
RUN $SCIDB_SOURCE_PATH/run.py make -j2


ARG SCIDB_INSTANCE_NUM=2
ARG SCIDB_NAME=scidb
ARG SCIDB_LOG_LEVEL=WARN

ENV SCIDB_INSTANCE_NUM=$SCIDB_INSTANCE_NUM             \
    SCIDB_NAME=$SCIDB_NAME                             \
    SCIDB_DATA_PATH=$SCIDB_INSTALL_PATH/DB-$SCIDB_NAME \
    SCIDB_SHIM=shim_${SCIDB_VER}_amd64.deb

# Jan 29, 2018 (session authentication)
ENV SHIM_SHA1=64f3a58fb2f97d014259247dcf2ae0714eeedd79


## Setup SSH
RUN echo 'StrictHostKeyChecking no'                        \
    >> /etc/ssh/ssh_config                                 \
    && ssh-keygen -f /root/.ssh/id_rsa -q -N ""            \
    && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


## Setup PostgreSQL and SciDB
RUN echo "127.0.0.1:5432:$SCIDB_NAME:$SCIDB_NAME:`                  \
            date +%s | sha256sum | base64 | head -c 32`"            \
    >  /root/.pgpass                                                \
    && chmod go-r /root/.pgpass                                     \
    && service ssh start                                            \
    && service postgresql start                                     \
    && echo n                                                       \
    |  $SCIDB_SOURCE_PATH/run.py install                            \
    && service postgresql stop                                      \
    && sed --in-place                                               \
        s/log4j.rootLogger=DEBUG/log4j.rootLogger=$SCIDB_LOG_LEVEL/ \
        $SCIDB_INSTALL_PATH/share/scidb/log1.properties


## Install Shim
# RUN wget --no-verbose --output-document /tmp/$SCIDB_SHIM \
#         http://paradigm4.github.io/shim/$SCIDB_SHIM      \
#     && dpkg --install /tmp/$SCIDB_SHIM                   \
#     && rm /tmp/$SCIDB_SHIM

RUN wget --no-verbose --output-document -                           \
        https://github.com/Paradigm4/shim/archive/$SHIM_SHA1.tar.gz \
    |  tar --extract --gzip --directory=/usr/local/src              \
    && cd /usr/local/src/shim-$SHIM_SHA1                            \
    && make service                                                 \
    && openssl req                                                  \
        -new                                                        \
        -newkey rsa:4096                                            \
        -days 3650                                                  \
        -nodes                                                      \
        -x509                                                       \
        -subj "/C=US/ST=MA/L=Waltham/O=Paradigm4/CN=$(hostname)"    \
        -keyout /var/lib/shim/ssl_cert.pem                          \
    2> /dev/null                                                    \
    >> /var/lib/shim/ssl_cert.pem


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


## Port | App
## -----+-----
## 1239 | SciDB iquery
## 8080 | SciDB Shim (HTTP)
## 8083 | SciDB Shim (HTTPS)
EXPOSE 1239 8080 8083
