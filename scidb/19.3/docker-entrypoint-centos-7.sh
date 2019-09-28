#!/bin/bash
set -o errexit

if [ -z "$SCIDB_DATA_PATH" ]
then
    SCIDB_DATA_PATH=$SCIDB_INSTALL_PATH/DB-$SCIDB_NAME
fi


echo "----------------------"
echo "Start SciDB by running"
echo "$SCIDB_INSTALL_PATH/bin/scidb.py startall $SCIDB_NAME"
echo "----------------------"


trap "$SCIDB_INSTALL_PATH/bin/scidb.py stopall $SCIDB_NAME"     \
     EXIT HUP INT QUIT TERM


exec /usr/sbin/init
