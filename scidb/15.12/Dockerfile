FROM rvernica/scidb:15.12-pre


## Build SciDB (leftover)
RUN $SCIDB_SOURCE_PATH/run.py make -j2


ARG SCIDB_INSTANCE_NUM=2
ARG SCIDB_NAME=scidb
ARG SCIDB_LOG_LEVEL=WARN

ENV SCIDB_INSTANCE_NUM=$SCIDB_INSTANCE_NUM \
    SCIDB_NAME=$SCIDB_NAME \
    SCIDB_DATA_PATH=$SCIDB_INSTALL_PATH/DB-$SCIDB_NAME

ENV SCIDB_SHIM=6db32a89d92ca05ca3c7475917aef04d18d82c97


## Setup SSH
RUN sed --in-place \
        's/session\s*required\s*pam_loginuid.so/session optional pam_loginuid.so/g' \
        /etc/pam.d/sshd && \
    echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config && \
    ssh-keygen -f /root/.ssh/id_rsa -q -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


## Setup PostgreSQL and SciDB
RUN echo "127.0.0.1:5432:$SCIDB_NAME:$SCIDB_NAME:`date +%s | sha256sum | base64 | head -c 32`" \
        > /root/.pgpass && \
    chmod go-r /root/.pgpass && \
    service ssh start && \
    service postgresql start && \
    echo n | $SCIDB_SOURCE_PATH/run.py install && \
    sed --in-place \
        s/log4j.rootLogger=DEBUG/log4j.rootLogger=$SCIDB_LOG_LEVEL/ \
        $SCIDB_INSTALL_PATH/share/scidb/log1.properties



## Install Shim
RUN wget --no-verbose --output-document - \
        https://github.com/Paradigm4/shim/archive/$SCIDB_SHIM.tar.gz | \
        tar --extract --gzip --directory=/usr/local/src && \
    cd /usr/local/src/shim-$SCIDB_SHIM && \
    rm --recursive src/network src/util && \
    cp --recursive $SCIDB_SOURCE_PATH/src/network                     src && \
    cp --recursive $SCIDB_SOURCE_PATH/src/util                        src && \
    cp --recursive $SCIDB_SOURCE_PATH/stage/build/src/network/proto/* src/network/proto && \
    make service


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


## Port | App
## -----+-----
## 1239 | SciDB iquery
## 8080 | SciDB Shim (HTTP)
## 8083 | SciDB Shim (HTTPS)
EXPOSE 1239 8080 8083
