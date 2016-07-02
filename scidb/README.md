SciDB
======

   * Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
   * Build on top of [Debian Linux](https://www.debian.org/)
   * Size: `~580MB-2GB`
   * Latest version: `15.7` (images for `15.12` are under development)
   * Automated build: [rvernica/scidb](https://hub.docker.com/r/rvernica/scidb/)

Tags
----

Five different tags are available for SciDB. Three are intended for the final user, while two are used for building. The tags intended for the final user are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.7`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile)         | `scidb:15.7-pre` | | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:15.7-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.deb) | `debian:8`       | | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages (Bintray)
| [`scidb:15.7-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.ext) | `scidb:15.7`     | `1.95GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim), [dev_tools](https://github.com/Paradigm4/dev_tools), and [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools)) |

The tags used for building are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.7-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pre) | `debian:8`       | `577.5MB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:15.7-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pkg) | `scidb:15.7`     | | Build SciDB Debian packages (.deb)

Usage
-----

When started, the images intended for the final user, use an [`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#/entrypoint) script to start SSH, PostgreSQL, SciDB, and Shim. Any additional arguments provided when container starts are executed at the end of this script. So, to get access to the container in interactive mode, append `bash` at the end of the `docker run` command. Below are a few examples.

Start container in interactive mode:

    > docker run --tty --interactive rvernica/scidb:15.7 bash
    ...
    # iquery --afl --query "list('libraries')"
    {inst,n} name,major,minor,patch,build,build_type
    {0,0} 'SciDB',15,7,0,9267,'Release'
    {1,0} 'SciDB',15,7,0,9267,'Release'

Start container in non-interactive mode:

    > docker run --tty rvernica/scidb:15.7
    ...

Start a `scidb:15.7-ext` container in interactive mode:

    > docker run --tty --interactive rvernica/scidb:15.7-ext bash
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


Ports Exposed
-------------

The image exposes the following ports:

| Port | Application | Usage                  |
| ---  | ---         | ---                    |
| 1239 | SciDB       | `iquery`               |
| 8080 | SciDB Shim  | http://localhost:8080  |
| 8083 | SciDB Shim  | https://localhost:8080 |

Build Details
-------------

The `scidb:15.7-pre`, `scidb:15.7`, and `scidb:15.7-ext` images are build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB build (version, paths, etc.);
1. Install dependencies from Debian `8` repository;
1. Install `openjdk-8-jdk` from [backports](https://backports.debian.org) repository;
1. Build from source `libpgxx3` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Install dependencies from [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) repository;
1. Download SciDB source code from [SciDB Forum](http://forum.paradigm4.com/t/scidb-release-15-7/843);
1. Apply patches required to build SciDB on Debian `8`;
1. Build SciDB libraries;
1. **`scidb:15.7-pre`** is created (necessary due to `2h` time limit for builds on Docker Hub);
1. Build SciDB;
1. Set environment variables for SciDB instance (number of instances, database name, etc.);
1. Setup password-less SSH;
1. Setup PostgreSQL credentials;
1. Install SciDB;
1. Install Shim;
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:15.7`** is created;
1. Install dependencies from Debian `8` repository;
1. Set SHA-1 commit hash for `dev_tools` and `accelerated_io_tools`;
1. Download and build `dev_tools`;
1. Start SciDB;
1. Load `dev_tools` in SciDB and install `accelerated_io_tools` from SciDB;
1. **`scidb:15.7-ext`** is created.

The `scidb:15.7-pkg` image is build as follows:

1. Base image is to to `scidb:15.7`;
1. Install dependencies from Debian `8` repository;
1. Build from source `libscalapack-mpi1` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Build SciDB `.deb` packages;
1. **`scidb:15.7-pkg`** is created.

Once the SciDB `.deb` packages generated in the `scidb:15.7-pkg` image are uploaded to the [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repository, the `scidb:15.7-deb` image is build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB (version, database name, etc.);
1. Install dependencies from Debian `8` repository;
1. Build from source `libpgxx3` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Build from source `libscalapack-mpi1` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Add [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) and [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repositories;
1. Install SciDB `.deb` packages;
1. Setup password-less SSH;
1. Setup `config.ini` for SciDB;
1. Setup PostgreSQL credentials;
1. Initialize SciDB (`init-syscat` and `init-all`);
1. Install Shim;
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:15.7-deb`** is created.

[![](https://badge.imagelayers.io/rvernica/scidb:latest.svg)](https://imagelayers.io/?images=rvernica/scidb:latest)
