# SciDB

   * Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
   * Build on top of [Debian Linux](https://www.debian.org/)
   * Size: `~600MB-2GB`
   * Latest version: `15.12`
   * Automated build at [Docker Hub](https://hub.docker.com/r/rvernica/scidb/)


# Tags

Five different tags are available for SciDB. Three are intended for the end user, while two are used for building.


## `15.12`

The tags intended for the end user are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.12`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile)         | `scidb:15.12-pre` | `1.972 GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:15.12-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.deb) | `debian:8`        | `602.3MB`  | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages ([Bintray](https://bintray.com/rvernica/deb))
| [`scidb:15.12-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.ext) | `scidb:15.12`     | `2.005GB`   | SciDB (w/ [Shim](https://github.com/Paradigm4/shim), [dev_tools](https://github.com/Paradigm4/dev_tools), and [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools)) |

The tags used for building are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.12-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.pre) | `debian:8`        | `1.612 GB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:15.12-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.pkg) | `scidb:15.12`     | `2.282 GB` | Build SciDB Debian packages (.deb)


## `15.7`

The tags intended for the end user are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.7`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile)         | `scidb:15.7-pre` | `1.918 GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:15.7-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.deb) | `debian:8`       | `602.1MB`  | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages ([Bintray](https://bintray.com/rvernica/deb))
| [`scidb:15.7-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.ext) | `scidb:15.7`     | `1.95GB`   | SciDB (w/ [Shim](https://github.com/Paradigm4/shim), [dev_tools](https://github.com/Paradigm4/dev_tools), and [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools)) |

The tags used for building are:

| Tag | From | Size | Comments |
| --- | --- | --- | --- |
| [`scidb:15.7-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pre) | `debian:8`       | `1.585 GB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:15.7-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pkg) | `scidb:15.7`     | `2.223 GB` | Build SciDB Debian packages (.deb)


# Usage

When started, the images intended for the end user, use an [`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#/entrypoint) script to start SSH, PostgreSQL, SciDB, and Shim. As a final command the entrypoint script tails the SciDB log. For example to start a base container and redirect its output to the console, use:

```bash
> docker run --tty rvernica/scidb:15.12
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
Starting shim
load = fn(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict){store(input(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict),output_array)};
sys_create_array_aux = fn(_A_,_E_,_C_){join(aggregate(apply(_A_,_t_,_E_),approxdc(_t_)),build(<values_per_chunk:uint64 null>[i=0:0,1,0],_C_))};
sys_create_array_att = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(_L_,min(_D_),max(_D_),approxdc(_D_)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])};
sys_create_array_dim = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(apply(aggregate(_L_,count(*),_D_),_t_,_D_),min(_t_),max(_t_),count(*)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])}
2016-07-04 08:50:40,221 [0x7fc8f59b77c0] [DEBUG]: Network manager is intialized
2016-07-04 08:50:40,221 [0x7fc8f59b77c0] [DEBUG]: NetworkManager::run()
2016-07-04 08:50:40,229 [0x7fc8f59b77c0] [DEBUG]: server-id = 0
2016-07-04 08:50:40,229 [0x7fc8f59b77c0] [DEBUG]: server-instance-id = 0
2016-07-04 08:50:40,232 [0x7fc8f59b77c0] [DEBUG]: Registered instance # 0
2016-07-04 08:50:40,232 [0x7fc8f59b77c0] [INFO ]: SciDB instance. SciDB Version: 15.12.1. Build Type: Release. Commit: 4cadab5. Copyright (C) 2008-2015 SciDB, Inc. is exiting.
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
```

Any additional arguments provided when a container is started are executed at the end of this script. So, to get access to the container in interactive mode, append `bash` at the end of the `docker run` command. For example, to start a base container in interactive mode, use:

```bash
> docker run --tty --interactive rvernica/scidb:15.12 bash
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
root@ea2f0c0b5314:/# iquery --afl --query "list('libraries')"
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',15,12,1,80403125,'Release'
{1,0} 'SciDB',15,12,1,80403125,'Release'
root@ea2f0c0b5314:/# exit
```
Here is an example for starting and interacting with a detached extended container:

```bash
> docker run --detach rvernica/scidb:15.12-ext
4579d727aa406c4f917780d48a4b591e19e3f14260a2444d48609d96eb12bc23
> docker logs 4579d72
Starting OpenBSD Secure Shell server: sshd.
Starting PostgreSQL 9.4 database server: main.
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
Starting shim
load = fn(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict){store(input(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict),output_array)};
sys_create_array_aux = fn(_A_,_E_,_C_){join(aggregate(apply(_A_,_t_,_E_),approxdc(_t_)),build(<values_per_chunk:uint64 null>[i=0:0,1,0],_C_))};
sys_create_array_att = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(_L_,min(_D_),max(_D_),approxdc(_D_)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])};
sys_create_array_dim = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(apply(aggregate(_L_,count(*),_D_),_t_,_D_),min(_t_),max(_t_),count(*)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])}
2016-07-04 08:50:40,221 [0x7fc8f59b77c0] [DEBUG]: Network manager is intialized
2016-07-04 08:50:40,221 [0x7fc8f59b77c0] [DEBUG]: NetworkManager::run()
2016-07-04 08:50:40,229 [0x7fc8f59b77c0] [DEBUG]: server-id = 0
2016-07-04 08:50:40,229 [0x7fc8f59b77c0] [DEBUG]: server-instance-id = 0
2016-07-04 08:50:40,232 [0x7fc8f59b77c0] [DEBUG]: Registered instance # 0
2016-07-04 08:50:40,232 [0x7fc8f59b77c0] [INFO ]: SciDB instance. SciDB Version: 15.12.1. Build Type: Release. Commit: 4cadab5. Copyright (C) 2008-2015 SciDB, Inc. is exiting.
> docker exec --tty 4579d72 iquery --afl --query "load_library('accelerated_io_tools'); list('libraries')"
Query was executed successfully
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',15,12,1,80403125,'Release'
{0,1} 'libaccelerated_io_tools.so',15,12,1,80403125,null
{0,2} 'libdev_tools.so',15,12,1,80403125,null
{1,0} 'SciDB',15,12,1,80403125,'Release'
{1,1} 'libaccelerated_io_tools.so',15,12,1,80403125,null
{1,2} 'libdev_tools.so',15,12,1,80403125,null
```

Here is an example for starting a debian-package-based container in interactive mode:

```bash
> docker run --tty --interactive rvernica/scidb:15.12-deb bash
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
root@fa37addad4e7:/# iquery --afl --query "list('libraries')"
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',15,12,1,80403125,'Release'
{1,0} 'SciDB',15,12,1,80403125,'Release'
root@fa37addad4e7:/# exit
```

# Ports Exposed

The image exposes the following ports:

| Port | Application        | Usage                  |
| ---  | ---                | ---                    |
| 1239 | SciDB              | `iquery`               |
| 8080 | SciDB Shim (HTTP)  | http://localhost:8080  |
| 8083 | SciDB Shim (HTTPS) | https://localhost:8080 |


# Build Details

The `scidb:15.12-pre`, `scidb:15.12`, and `scidb:15.12-ext` images are build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB build (version, paths, etc.);
1. Install dependencies from Debian `8` repository;
1. Install `openjdk-8-jdk` from [backports](https://backports.debian.org) repository;
1. Build from source and install `libpgxx3` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Install dependencies from [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) repository;
1. Download SciDB source code from [SciDB Forum](http://forum.paradigm4.com/t/scidb-release-15-7/843);
1. Apply Paradigm4 patches [published](https://docs.google.com/document/d/1Ohgu89rnlUR-OuCyZ1SBCkP9mTuVLTrXVw-bm4AHxow/edit) after SciDB `15.12` release;
1. Apply patches required to build SciDB on Debian `8`;
1. Build SciDB libraries;
1. **`scidb:15.12-pre`** is created (necessary due to `2h` time limit for builds on Docker Hub);
1. Build SciDB;
1. Set environment variables for SciDB instance (number of instances, database name, etc.);
1. Set SHA-1 commit hash for Shim;
1. Setup password-less SSH;
1. Setup PostgreSQL credentials;
1. Install SciDB;
1. Build from source and install Shim (`.deb` package provided on Paradigm4 GitHub cannot be used due to dependency on `libprotobuf8`; only `7` and `9` are available in Debian);
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:15.12`** is created;
1. Install dependencies from Debian `8` repository;
1. Set SHA-1 commit hash for `dev_tools` and `accelerated_io_tools`;
1. Download and build `dev_tools`;
1. Start SciDB;
1. Load `dev_tools` in SciDB and install `accelerated_io_tools` from SciDB;
1. **`scidb:15.12-ext`** is created.

The `scidb:15.12-pkg` image is build as follows:

1. Base image is set to `scidb:15.12`;
1. Install dependencies from Debian `8` repository;
1. Build from source and install `libscalapack-mpi1` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Build SciDB `.deb` packages;
1. Build Shim `.deb` package;
1. **`scidb:15.12-pkg`** is created.

Once the SciDB `.deb` packages generated in the `scidb:15.12-pkg` image are uploaded to the [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repository, the `scidb:15.12-deb` image is build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB (version, database name, etc.);
1. Install dependencies from Debian `8` repository;
1. Build from source and install `libpgxx3` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Build from source and install `libscalapack-mpi1` from Debian `7` (unnecessary packages are removed once the `.deb` files are built);
1. Add [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) and [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repositories;
1. Install SciDB and Shim from `.deb` packages;
1. Setup password-less SSH;
1. Setup `config.ini` for SciDB;
1. Setup PostgreSQL credentials;
1. Initialize SciDB (`init-syscat` and `init-all`);
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:15.12-deb`** is created.

[![](https://badge.imagelayers.io/rvernica/scidb:latest.svg)](https://imagelayers.io/?images=rvernica/scidb:latest)
