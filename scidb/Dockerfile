FROM rvernica/scidb:pre

ENV SCIDB_VER=15.7 \
    SCIDB_INSTALL_PATH=/usr/local/scidb \
    SCIDB_BUILD_TYPE=Release


ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive


## Compile SciDB source
RUN /usr/src/scidb-15.7.0.9267/run.py make -j2


## Apply patch and set mydb password
COPY run.py.oscheck_datapath.patch /usr/src/scidb-15.7.0.9267/
RUN cd /usr/src/scidb-15.7.0.9267 && \
    patch --strip=0 < run.py.oscheck_datapath.patch && \
    echo "127.0.0.1:5432:mydb:mydb:mydb" > /root/.pgpass && \
    chmod go-r /root/.pgpass


# service ssh start
# service postgresql start
# /usr/src/scidb-15.7.0.9267/run.py install --force
# scidb.py startall mydb
# iquery --afl --query "list()"
# scidb.py stopall mydb
