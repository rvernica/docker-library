#!/bin/bash
set -o errexit

if [ -z "$SCIDB_DATA_PATH" ]
then
    SCIDB_DATA_PATH=$SCIDB_INSTALL_PATH/DB-$SCIDB_NAME
fi


echo "----------------------"
echo "Start Docker container with the following arguments:"
echo "  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro"
echo '  --volume /tmp/$(mktemp --directory):/run'
echo "Start SciDB by running"
echo "  $SCIDB_INSTALL_PATH/bin/scidbctl.py start $SCIDB_NAME"
echo "Start Shim by running"
echo "  systemctl start shimsvc"
echo "----------------------"


trap "$SCIDB_INSTALL_PATH/bin/scidb.py stopall $SCIDB_NAME"     \
     EXIT HUP INT QUIT TERM


exec /usr/sbin/init
