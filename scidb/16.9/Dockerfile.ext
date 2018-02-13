FROM rvernica/scidb:16.9


## Install dependencies
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main"               \
    >  /etc/apt/sources.list.d/trusty-main.list                               \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys               \
        40976EAF437D05B5                                                      \
        3B4FE6ACC0B21F32                                                      \
    && echo "deb https://packages.red-data-tools.org/ubuntu/ trusty universe" \
    >> /etc/apt/sources.list.d/red-data-tools.list                            \
    && apt-get update                                                         \
    && apt-get install                                                        \
         --assume-yes                                                         \
         --no-install-recommends                                              \
         --allow-unauthenticated                                              \
        red-data-tools-keyring                                                \
    && apt-get update                                                         \
    && apt-get install --assume-yes --no-install-recommends                   \
        bc                                                                    \
        libarrow-dev                                                          \
        libarrow0                                                             \
        libpcre3-dev                                                          \
    && rm -rf /var/lib/apt/lists/*                                            \
    && wget --no-verbose https://bootstrap.pypa.io/get-pip.py                 \
    && python get-pip.py                                                      \
    && pip install scidb-strm==16.9.1


ARG SCIDB_DEV_TOOLS=332127216cd6d5791320abafd767e09164cd22e2
ARG SCIDB_ACCELERATED_IO_TOOLS=c7dac75ff51d945b40c5b87c0d8e0e52cc8a8a68
ARG SCIDB_EQUI_JOIN=3e4971b3296a449711fd23c457cb6a8cfc0fcfc9
ARG SCIDB_GROUPED_AGGREGATE=c3e9342a8019c1710e043bb708bd784d40e6d4fb
ARG SCIDB_LIMIT=bd0751d226e734ab721cbbc161c69ff677bb4922
ARG SCIDB_STREAM=cf83752dd8e5cdd045abc2ae8e8482e16cb091e5
ARG SCIDB_SUMMARIZE=4eae8663a8d054e375bdca6d897305dc36f3d382
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
