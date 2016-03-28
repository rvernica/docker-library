FROM rvernica/scidb:pre

ENV SCIDB_VER=15.7 \
    SCIDB_INSTALL_PATH=/usr/local/scidb \
    SCIDB_BUILD_TYPE=Release


ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive


RUN wget --no-verbose --output-document - \
    http://forum.paradigm4.com/uploads/db6652/original/1X/af46ea0924d43cd943a10a3c83ecf778800bf2a0.tgz | \
    tar xzf - -C /usr/src
WORKDIR /usr/src/scidb-15.7.0.9267
RUN ./run.py setup --force
RUN ./run.py make -j2


COPY run.py.oscheck_datapath.patch .
RUN patch --strip=0 < run.py.oscheck_datapath.patch
RUN echo "127.0.0.1:5432:mydb:mydb:mydb" > /root/.pgpass


# service ssh start && service postgresql start && ./run.py install --force
# /usr/local/scidb/bin/scidb.py startall mydb
# /usr/local/scidb/bin/iquery --afl --query "list()"
