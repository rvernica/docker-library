FROM rvernica/scidb:16.9


## Install dependencies
RUN apt-get update                                          \
    && apt-get install --assume-yes --no-install-recommends \
        ant-optional                                        \
        build-essential                                     \
        debhelper                                           \
        docbook-xsl                                         \
        doxygen                                             \
        dpkg-dev                                            \
        fop                                                 \
        git                                                 \
        libblacs-openmpi1                                   \
        libpam-dev                                          \
        libscalapack-openmpi1                               \
        ruby                                                \
        ruby-dev                                            \
        subversion                                          \
        swig2.0                                             \
        xsltproc                                            \
    && rm -rf /var/lib/apt/lists/*                          \
    && gem install fpm


## Build .deb packages
RUN cd $SCIDB_SOURCE_PATH             \
    && ./run.py make_packages --force

# RUN make --directory=/usr/local/src/shim-$SHIM_SHA1 deb-pkg
