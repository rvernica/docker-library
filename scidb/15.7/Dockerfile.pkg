FROM rvernica/scidb:15.7


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
        subversion                                          \
        swig2.0                                             \
        xsltproc                                            \
    && rm -rf /var/lib/apt/lists/*


## Build .deb packages
RUN cd $SCIDB_SOURCE_PATH             \
    && ./run.py make_packages --force
