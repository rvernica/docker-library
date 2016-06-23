FROM rvernica/scidb:15.7-base


## Install dependencies
RUN apt-get update && apt-get install --assume-yes \
        bc \
        libboost1.55-dev \
    && rm -rf /var/lib/apt/lists/*


ENV SCIDB_DEV_TOOLS=v15.7


## Install dev_tools
RUN wget --no-verbose --output-document /usr/src/dev_tools.zip \
        https://codeload.github.com/Paradigm4/dev_tools/zip/$SCIDB_DEV_TOOLS && \
    unzip /usr/src/dev_tools.zip -d /usr/src && \
    export SCIDB_DEV_TOOLS_DIR=dev_tools-`echo $SCIDB_DEV_TOOLS | sed s/^v//` && \
    make --directory=/usr/src/$SCIDB_DEV_TOOLS_DIR && \
    cp /usr/src/$SCIDB_DEV_TOOLS_DIR/*.so /usr/local/scidb/lib/scidb/plugins


## Install accelerated_io_tools
RUN service ssh start && \
    service postgresql start && \
    scidb.py startall $SCIDB_NAME && \
    iquery --afl --query "load_library('dev_tools'); install_github('paradigm4/accelerated_io_tools', '$SCIDB_DEV_TOOLS', 'https_proxy=$https_proxy')"
# cp /root/.pgpass /root/.pgpass.bk && mv /root/.pgpass.bk /root/.pgpass &&
