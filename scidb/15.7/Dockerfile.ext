FROM rvernica/scidb:15.7-base


## Install dependencies
RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
        bc \
        libboost1.55-dev \
    && rm -rf /var/lib/apt/lists/*


ENV SCIDB_DEV_TOOLS=d59838b5d99d63791a68d8db45dc140b85531368
ENV SCIDB_ACCELERATED_IO_TOOLS=cc8be674f0531b40d2bcecf823da41e4204b5d43
ENV PATH=$PATH:$SCIDB_INSTALL_PATH/bin


## Install dev_tools
RUN wget --no-verbose --output-document - \
        https://github.com/rvernica/dev_tools/archive/$SCIDB_DEV_TOOLS.tar.gz | \
        tar --extract --gzip --directory=/usr/src && \
    make --directory=/usr/src/dev_tools-$SCIDB_DEV_TOOLS && \
    cp /usr/src/dev_tools-$SCIDB_DEV_TOOLS/*.so \
        $SCIDB_INSTALL_PATH/lib/scidb/plugins && \
    rm -rf /usr/src/dev_tools-$SCIDB_DEV_TOOLS


## Install accelerated_io_tools
## Re-create ".pgpass" file due to hard links created by Docker Hub
RUN cp /root/.pgpass /root/.pgpass.bk && mv /root/.pgpass.bk /root/.pgpass && \
    service ssh start && \
    service postgresql start && \
    scidb.py startall $SCIDB_NAME && \
    iquery --afl --query \
        "load_library('dev_tools'); \
         install_github( \
             'paradigm4/accelerated_io_tools', \
             '$SCIDB_ACCELERATED_IO_TOOLS', \
             'https_proxy=$https_proxy')"
