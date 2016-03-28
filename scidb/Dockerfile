FROM rvernica/scidb:pre

ENV SCIDB_VER=15.7 \
    SCIDB_INSTALL_PATH=/usr/local/scidb \
    SCIDB_BUILD_TYPE=Release


ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive


## Compile SciDB source
WORKDIR /usr/src/scidb-15.7.0.9267
RUN ./run.py make -j2


## Apply patch and set mydb password
COPY run.py.oscheck_datapath.patch .
RUN patch --strip=0 < run.py.oscheck_datapath.patch
RUN echo "127.0.0.1:5432:mydb:mydb:mydb" > /root/.pgpass && \
    chmod go-r /root/.pgpass


# service ssh start && service postgresql start && ./run.py install --force
# /usr/local/scidb/bin/scidb.py startall mydb
# /usr/local/scidb/bin/iquery --afl --query "list()"
