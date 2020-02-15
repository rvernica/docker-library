FROM debian:8


ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive

ARG SCIDB_NAME=scidb
ARG SCIDB_LOG_LEVEL=WARN

ARG SHIM_SHA1=fbec1fc3aadcf3134cea0ceabb3fa32321474b23


ENV SCIDB_VER=19.3   \
    SCIDB_NAME=scidb

ENV SCIDB_INSTALL_PATH=/opt/scidb/$SCIDB_VER

ENV PATH=$PATH:$SCIDB_INSTALL_PATH/bin


ARG SCIDB_SCRIPT_URL="https://downloads.paradigm4.com/community/$SCIDB_VER/install-scidb-ce.sh"


## Add Ubuntu package repository for libprotobuf8
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main"            \
    >> /etc/apt/sources.list.d/trusty-main.list                         \
    && apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys        \
        1FE11567623A70C9                                                \
        3B4FE6ACC0B21F32                                                \
        40976EAF437D05B5


## Install dependencies
RUN apt-get update                                              \
    && apt-get install --assume-yes --no-install-recommends     \
        apt-transport-https                                     \
        ca-certificates                                         \
        gcc-4.9                                                 \
        liblog4cxx10-dev                                        \
        libssl-dev                                              \
        openssh-client                                          \
        openssh-server                                          \
        patch                                                   \
        wget                                                    \
        zlib1g-dev                                              \
    && apt-get install --assume-yes --no-install-recommends     \
        --target-release trusty                                 \
        libprotobuf-dev                                         \
    && rm -rf /var/lib/apt/lists/*


## Get SciDB install script
RUN wget --no-verbose --output-document /install-scidb-ce.sh $SCIDB_SCRIPT_URL
RUN chmod +x /install-scidb-ce.sh


## Apply Debian patch
COPY install-scidb-ce.sh.debian.patch /
RUN patch --strip=1 \
    <  install-scidb-ce.sh.debian.patch


## Run SciDB install script
RUN apt-get update                                              \
    && yes                                                      \
    | /install-scidb-ce.sh                                      \
    && apt-get install --assume-yes --no-install-recommends     \
        make                                                    \
        scidb-$SCIDB_VER-dev                                    \
        scidb-$SCIDB_VER-libboost1.54-dev                       \
        scidb-$SCIDB_VER-libboost-system1.54-dev                \
    && rm -rf /var/lib/apt/lists/*


## Setup SSH
RUN echo 'StrictHostKeyChecking no'                        \
    >> /etc/ssh/ssh_config                                 \
    && ssh-keygen -f /root/.ssh/id_rsa -q -N ""            \
    && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


## Setup SciDB config file
COPY config.ini $SCIDB_INSTALL_PATH/etc/


## Setup PostgreSQL and SciDB
RUN echo "127.0.0.1:5432:$SCIDB_NAME:$SCIDB_NAME:`                      \
            date +%s | sha256sum | base64 | head -c 32`"                \
    >  /root/.pgpass                                                    \
    && chmod go-r /root/.pgpass                                         \
    && chmod a+r $SCIDB_INSTALL_PATH/etc/config.ini                     \
    && service ssh start                                                \
    && service postgresql start                                         \
    && until pg_isready; do sleep 1; done                               \
    && su --command="                                                   \
            $SCIDB_INSTALL_PATH/bin/scidbctl.py init-syscat $SCIDB_NAME \
                --db-password `                                         \
                    cut --delimiter : --fields 5  /root/.pgpass`"       \
        postgres                                                        \
    && $SCIDB_INSTALL_PATH/bin/scidbctl.py init-cluster --force         \
        $SCIDB_NAME                                                     \
    && service postgresql stop                                          \
    && sed --in-place                                                   \
        s/log4j.rootLogger=INFO/log4j.rootLogger=$SCIDB_LOG_LEVEL/      \
        $SCIDB_INSTALL_PATH/share/scidb/log4cxx.properties


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


## Setup container entrypoint
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


## Port | App
## -----+-----
## 1239 | SciDB iquery
## 8080 | SciDB Shim (HTTP)
## 8083 | SciDB Shim (HTTPS)
EXPOSE 1239 8080 8083
