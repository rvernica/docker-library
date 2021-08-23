#!/bin/bash

set -o errexit


# Setup SSH
# ---
echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

ssh-keygen -A

ssh-keygen -f /root/.ssh/id_rsa -q -N ""
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

/usr/sbin/sshd


# Init PostgreSQL
# ---
echo "127.0.0.1:5432:scidb:scidb:`date +%s | sha256sum | base64 | head -c 32`"  \
    >  /root/.pgpass
chmod go-r /root/.pgpass
su --command="                                  \
    /usr/pgsql-9.3/bin/pg_ctl initdb            \
        -D /var/lib/pgsql/9.3/data/"            \
    postgres

sed --in-place s/\\.\\.\\.0/172.17.0.0/         \
    /var/lib/pgsql/9.3/data/pg_hba.conf


# Start PostgreSQL
# ---
su --command="                                  \
    /usr/pgsql-9.3/bin/pg_ctl start             \
        -D /var/lib/pgsql/9.3/data/             \
        -s                                      \
        -w                                      \
        -t 300"                                 \
   postgres

until su --command="/usr/pgsql-9.3/bin/pg_isready" postgres
do
    sleep 1
done

systemctl enable postgresql-9.3


# Init SciDB
# ---
chmod a+r /opt/scidb/19.11/etc/config.ini
su --command="                                                          \
    /opt/scidb/19.11/bin/scidbctl.py init-syscat scidb                  \
        --db-password `cut --delimiter : --fields 5  /root/.pgpass`"    \
   postgres

/opt/scidb/19.11/bin/scidbctl.py init-cluster --force scidb

# sed --in-place                                          \
#     s/log4j.rootLogger=INFO/log4j.rootLogger=WARN/      \
#     /opt/scidb/19.11/share/scidb/log4cxx.properties


# Stop PostgreSQL
# ---
su --command="                                  \
    /usr/pgsql-9.3/bin/pg_ctl stop              \
        -D /var/lib/pgsql/9.3/data/             \
        -s                                      \
        -m fast"                                \
   postgres
