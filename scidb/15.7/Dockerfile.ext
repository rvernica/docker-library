FROM rvernica/scidb:15.7


## Install dependencies
RUN apt-get update                                          \
    && apt-get install --assume-yes --no-install-recommends \
        bc                                                  \
        libpcre3-dev                                        \
    && rm -rf /var/lib/apt/lists/*


ARG SCIDB_DEV_TOOLS=d59838b5d99d63791a68d8db45dc140b85531368
ARG SCIDB_ACCELERATED_IO_TOOLS=cc8be674f0531b40d2bcecf823da41e4204b5d43
ARG SCIDB_GROUPED_AGGREGATE=3b128d0b6eecec09e9f21329b08a0c166c2b7ce6
ARG SCIDB_LIMIT=5cd0c02f7718e507facf763cc6307694210b0011
ARG SCIDB_SUMMARIZE=dda6e7db4a2c215822546318da9395e6b9ee14c3
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
RUN sed --in-place s/\#aio=1/aio=1/ /var/lib/shim/conf
