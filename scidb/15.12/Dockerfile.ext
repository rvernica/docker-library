FROM rvernica/scidb:15.12


## Install dependencies
RUN apt-get update                                          \
    && apt-get install --assume-yes --no-install-recommends \
        bc                                                  \
        libpcre3-dev                                        \
    && rm -rf /var/lib/apt/lists/*


ARG SCIDB_DEV_TOOLS=332127216cd6d5791320abafd767e09164cd22e2
ARG SCIDB_ACCELERATED_IO_TOOLS=24351eab346493000f358ea05736e29f0b6b565f
ARG SCIDB_EQUI_JOIN=3465ed8f3a1554288601f94f5742d4d9a464a83d
ARG SCIDB_GROUPED_AGGREGATE=be5bbb7df070a2b7c653c16d5e660d03af9800de
ARG SCIDB_LIMIT=5eef2a7d625f9b1e1819495cc32ee5f80bcf9b6b
ARG SCIDB_STREAM=b4ba7e2999c06a57872501e1a22aed1d5faa2980
ARG SCIDB_SUMMARIZE=7ddfd45090fd45369f2de5f0d4d2d51c6a2d3a1d
ARG SCIDB_SUPERFUNPACK=d3bf0c94ca767153bd6779ee9a8af0a875cb17d0


## Install dev_tools
RUN wget --no-verbose --output-document -                                      \
        https://github.com/Paradigm4/dev_tools/archive/$SCIDB_DEV_TOOLS.tar.gz \
    |  tar --extract --gzip --directory=/usr/local/src                         \
    && make --directory=/usr/local/src/dev_tools-$SCIDB_DEV_TOOLS              \
    && cp /usr/local/src/dev_tools-$SCIDB_DEV_TOOLS/*.so                       \
        $SCIDB_INSTALL_PATH/lib/scidb/plugins                                  \
    && rm -rf /usr/local/src/dev_tools-$SCIDB_DEV_TOOLS


## Install Paradigm4 plug-ins
## Re-create ".pgpass" file due to hard links created by Docker Hub
RUN cp /root/.pgpass /root/.pgpass.bk          \
    && mv /root/.pgpass.bk /root/.pgpass       \
    && service ssh start                       \
    && service postgresql start                \
    && scidb.py startall $SCIDB_NAME           \
    && iquery --afl --query                    \
        "load_library('dev_tools');            \
                                               \
         install_github(                       \
             'Paradigm4/accelerated_io_tools', \
             '$SCIDB_ACCELERATED_IO_TOOLS',    \
             'https_proxy=$https_proxy');      \
         load_library('accelerated_io_tools'); \
                                               \
         install_github(                       \
             'Paradigm4/equi_join',            \
             '$SCIDB_EQUI_JOIN',               \
             'https_proxy=$https_proxy');      \
         load_library('equi_join');            \
                                               \
         install_github(                       \
             'Paradigm4/grouped_aggregate',    \
             '$SCIDB_GROUPED_AGGREGATE',       \
             'https_proxy=$https_proxy');      \
         load_library('grouped_aggregate');    \
                                               \
         install_github(                       \
             'Paradigm4/limit',                \
             '$SCIDB_LIMIT',                   \
             'https_proxy=$https_proxy');      \
         load_library('limit');                \
                                               \
         install_github(                       \
             'Paradigm4/stream',               \
             '$SCIDB_STREAM',                  \
             'https_proxy=$https_proxy');      \
         load_library('stream');               \
                                               \
         install_github(                       \
             'Paradigm4/summarize',            \
             '$SCIDB_SUMMARIZE',               \
             'https_proxy=$https_proxy');      \
         load_library('summarize');            \
                                               \
         install_github(                       \
             'Paradigm4/superfunpack',         \
             '$SCIDB_SUPERFUNPACK',            \
             'https_proxy=$https_proxy');      \
         load_library('superfunpack')"         \
    && scidb.py stopall $SCIDB_NAME            \
    && service postgresql stop


## Update Shim conf to use aio
RUN echo aio=1            \
    >> /var/lib/shim/conf
