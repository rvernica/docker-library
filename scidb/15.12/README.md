ScidDB
======

*   Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
*   Build on top of [Debian Linux](https://www.debian.org/) [image](https://hub.docker.com/_/debian/)
*   Size: `~2GB`

Notes
-----

The image contains SciDB DBMS compiled from source. SciDB starts when a container is created. The image has a *base* and an *enhanced* version:

   * [`rvernica/scidb:15.7-base`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.base) for the *base* version
   * [`rvernica/scidb:15.7`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile) for the *enhanced* version

The *base* version contains a functional SciDB DBMS with [Shim](https://github.com/Paradigm4/shim). The *enhanced* version contains the *base* version plus the [dev_tools](https://github.com/Paradigm4/dev_tools/) and the [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools) libraries.

Start *base* version in interactive mode:

    > docker run --tty --interactive rvernica/scidb:15.7-base bash
    ...
    # iquery --afl --query "list('libraries')"
    {inst,n} name,major,minor,patch,build,build_type
    {0,0} 'SciDB',15,7,0,9267,'Release'
    {1,0} 'SciDB',15,7,0,9267,'Release'

Start *base* version in non-interactive mode:

    > docker run --tty rvernica/scidb:15.7-base
    ...

Start *enhanced* version in interactive mode:

    > docker run --tty --interactive rvernica/scidb:15.7 bash
    ...
    # iquery --afl --query "load_library('accelerated_io_tools'); list('libraries')"
    Query was executed successfully
    {inst,n} name,major,minor,patch,build,build_type
    {0,0} 'SciDB',15,7,0,9267,'Release'
    {0,1} 'libaccelerated_io_tools.so',15,7,0,9267,null
    {0,2} 'libdev_tools.so',15,7,0,9267,null
    {1,0} 'SciDB',15,7,0,9267,'Release'
    {1,1} 'libaccelerated_io_tools.so',15,7,0,9267,null
    {1,2} 'libdev_tools.so',15,7,0,9267,null


The image exposes the following ports:

| Port | Application | Usage |
| --- | --- | --- |
| 1239 | SciDB      | `iquery`               |
| 8080 | SciDB Shim | http://localhost:8080  |
| 8083 | SciDB Shim | https://localhost:8080 |

The SciDB source code is downloaded and compiled when the image is built. The image is built automatically on [Docker Hub](https://hub.docker.com/). Docker Hub has a two-hour time limit for image builds. Because compiling SciDB on Docker Hub exceeds the time limit, there is a third image version, [*pre*](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pre). The *pre* image installs the requirements and compiles some of the SciDB libraries. This image is partial and not intended to be used by the end user. The *base* image continues from where *pre* left off.


[![](https://badge.imagelayers.io/rvernica/scidb:latest.svg)](https://imagelayers.io/?images=rvernica/scidb:latest)
