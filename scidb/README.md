ScidDB
======

*   Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
*   Build on top of [Debian](https://www.debian.org/) Linux
*   Size: `~1.9GB`

Notes
-----

The image contains all the required Debian packages (except for R) and
SciDB DBMS compiled from source. (When the image is built, the SciDB
source code is downloaded and compiled.)

The last installation step needs to be run manually:

    > docker run --tty --interactive rvernica/scidb bash
    # service ssh start
    # service postgresql start
    # ./run.py install --force

Start SciDB:

    # /usr/local/scidb/bin/scidb.py startall mydb

Example:

    # /usr/local/scidb/bin/iquery --afl --query "list()"
