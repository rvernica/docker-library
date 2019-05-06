#!/bin/bash
set -o errexit

if [ -z "$SCIDB_DATA_PATH" ]
then
    SCIDB_DATA_PATH=$SCIDB_INSTALL_PATH/DB-$SCIDB_NAME
fi


/usr/sbin/sshd
su --command="                                  \
    /usr/pgsql-9.3/bin/pg_ctl start             \
        -D /var/lib/pgsql/9.3/data/             \
        -s                                      \
        -w                                      \
        -t 300"                                 \
        postgres
# service shimsvc           start


$SCIDB_INSTALL_PATH/bin/scidbctl.py start $SCIDB_NAME


trap "$SCIDB_INSTALL_PATH/bin/scidbctl.py stop $SCIDB_NAME;     \
      su --command=\"                                           \
            /usr/pgsql-9.3/bin/pg_ctl stop                      \
                -D /var/lib/pgsql/9.3/data/                     \
                -s                                              \
                -m fast\"                                       \
                postgres"                                       \
     EXIT HUP INT QUIT TERM


if [ "$1" = '' ]
then
    tail -f $SCIDB_DATA_PATH/0/0/scidb.log
else
    exec "$@"
fi
