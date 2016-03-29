ScidDB
======

*   Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
*   Build on top of [Debian Linux](https://www.debian.org/)
*   Size: `~1.9GB`

Notes
-----

The image contains all the required Debian packages (except for R) and
the SciDB DBMS compiled from source.

The last installation step needs to be run manually:

    > docker run --tty --interactive rvernica/scidb bash
    # service ssh start
    # service postgresql start
    # /usr/src/scidb-15.7.0.9267/run.py install --force

Start SciDB:

    # scidb.py startall mydb

Example:

    # iquery --afl --query "list()"

Stop SciDB:

    # scidb.py stopall mydb

The SciDB source code is downloaded and compiled when the image is
built. The image is build automatically on
[Docker Hub](https://hub.docker.com/). Docker Hub has a two hour time
limit for image builds. Compiling SciDB on Docker Hub exceeds the time
limit. For this reason, this image is split into two parts:

* [Dockerfile.pre](https://github.com/rvernica/Dockerfile/blob/master/scidb/Dockerfile.pre)
  which installs the required Debian packages and compiles the SciDB
  libraries. The resulting image is an intermediary image not intended
  to be used by the end user.

* [Dockerfile](https://github.com/rvernica/Dockerfile/blob/master/scidb/Dockerfile)
  which finishes up compiling SciDB and does the final setup. The
  resulting image is intended to be used by the end user.


[![](https://badge.imagelayers.io/rvernica/scidb:latest.svg)](https://imagelayers.io/?images=rvernica/scidb:latest)
