#!/bin/bash
set -o errexit

echo "----------------------"
echo "Start Docker container with the following arguments:"
echo "  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro"
echo '  --volume /tmp/$(mktemp --directory):/run'
echo "Start SciDB by running"
echo "  /opt/scidb/19.11/bin/scidbctl.py start"
echo "Start Shim by running"
echo "  systemctl start shimsvc"
echo "----------------------"


trap "/opt/scidb/19.11/bin/scidb.py stopall"    \
     EXIT HUP INT QUIT TERM


exec /usr/sbin/init
