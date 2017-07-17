# SciDB

   * Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
   * Build on top of [Debian Linux](https://www.debian.org/)
   * Size: `~400MB-2GB`
   * Latest version: `16.9`
   * Automated build at [Docker Hub](https://hub.docker.com/r/rvernica/scidb/) [![](https://images.microbadger.com/badges/version/rvernica/scidb.svg)](https://microbadger.com/images/rvernica/scidb)


# Tags

Five different tags are available for SciDB. Three are intended for the end user, while two are used for building.


## `16.9`

The tags intended for the end user are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:16.9`](https://github.com/rvernica/docker-library/blob/master/scidb/16.9/Dockerfile)         | `scidb:16.9-pre` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:16.9.svg)](https://microbadger.com/images/rvernica/scidb:16.9)         | `1.866GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:16.9-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/16.9/Dockerfile.deb) | `debian:8`       | [![](https://images.microbadger.com/badges/image/rvernica/scidb:16.9-deb.svg)](https://microbadger.com/images/rvernica/scidb:16.9-deb) | `410.6MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages ([Bintray](https://bintray.com/rvernica/deb))
| [`scidb:16.9-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/16.9/Dockerfile.ext) | `scidb:16.9`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:16.9-ext.svg)](https://microbadger.com/images/rvernica/scidb:16.9-ext) | `1.899GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))

The tags used for building are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:16.9-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/16.9/Dockerfile.pre) | `debian:8`        | [![](https://images.microbadger.com/badges/image/rvernica/scidb:16.9-pre.svg)](https://microbadger.com/images/rvernica/scidb:16.9-pre) | `1.452GB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:16.9-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/16.9/Dockerfile.pkg) | `scidb:16.9`      | [![](https://images.microbadger.com/badges/image/rvernica/scidb:16.9-pkg.svg)](https://microbadger.com/images/rvernica/scidb:16.9-pkg) | `2.213GB` | Build SciDB Debian packages (.deb)


## `15.12`

The tags intended for the end user are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:15.12`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile)         | `scidb:15.12-pre` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.12.svg)](https://microbadger.com/images/rvernica/scidb:15.12)         | `1.892GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:15.12-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.deb) | `debian:8`        | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.12-deb.svg)](https://microbadger.com/images/rvernica/scidb:15.12-deb) | `529.3MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages ([Bintray](https://bintray.com/rvernica/deb))
| [`scidb:15.12-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.ext) | `scidb:15.12`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.12-ext.svg)](https://microbadger.com/images/rvernica/scidb:15.12-ext) | `1.926GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))

The tags used for building are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:15.12-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.pre) | `debian:8`        | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.12-pre.svg)](https://microbadger.com/images/rvernica/scidb:15.12-pre) | `1.546GB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:15.12-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/15.12/Dockerfile.pkg) | `scidb:15.12`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.12-pkg.svg)](https://microbadger.com/images/rvernica/scidb:15.12-pkg) | `2.246GB` | Build SciDB Debian packages (.deb)


## `15.7`

The tags intended for the end user are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:15.7`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile)         | `scidb:15.7-pre` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.7.svg)](https://microbadger.com/images/rvernica/scidb:15.7)         | `1.835GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:15.7-deb`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.deb) | `debian:8`       | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.7-deb.svg)](https://microbadger.com/images/rvernica/scidb:15.7-deb) | `527MB`   | SciDB (w/ [Shim](https://github.com/Paradigm4/shim)) from Debian packages ([Bintray](https://bintray.com/rvernica/deb))
| [`scidb:15.7-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.ext) | `scidb:15.7`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.7-ext.svg)](https://microbadger.com/images/rvernica/scidb:15.7-ext) | `1.867GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))

The tags used for building are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:15.7-pre`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pre) | `debian:8`       | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.7-pre.svg)](https://microbadger.com/images/rvernica/scidb:15.7-pre) | `1.437GB` | Install and build SciDB dependencies and libs, respectively
| [`scidb:15.7-pkg`](https://github.com/rvernica/docker-library/blob/master/scidb/15.7/Dockerfile.pkg) | `scidb:15.7`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:15.7-pkg.svg)](https://microbadger.com/images/rvernica/scidb:15.7-pkg) | `2.138GB` | Build SciDB Debian packages (.deb)


# Usage

When started, the images intended for the end user, use an [`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#/entrypoint) script to start SSH, PostgreSQL, SciDB, and Shim. As a final command the entrypoint script tails the SciDB log. For example to start a base container and redirect its output to the console, use:

```bash
> docker run --tty rvernica/scidb:16.9
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
load = fn(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict){store(input(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict),output_array)};
sys_create_array_aux = fn(_A_,_E_,_C_){join(aggregate(apply(_A_,_t_,_E_),approxdc(_t_)),build(<values_per_chunk:uint64 null>[i=0:0,1,0],_C_))};
sys_create_array_att = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(_L_,min(_D_),max(_D_),approxdc(_D_)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])};
sys_create_array_dim = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(apply(aggregate(_L_,count(*),_D_),_t_,_D_),min(_t_),max(_t_),count(*)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])}
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: Network manager is intialized
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: NetworkManager::run()
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: server-id = 0
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: server-instance-id = 0
2016-12-23 01:55:54,212 [0x7f0e097df880] [DEBUG]: Registered instance # 0
2016-12-23 01:55:54,212 [0x7f0e097df880] [INFO ]: SciDB instance. SciDB Version: 16.9.0. Build Type: Release. Commit: db1a98f. Copyright (C) 2008-2015 SciDB, Inc. is exiting.
```

Any additional arguments provided when a container is started are executed at the end of this script. So, to get access to the container in interactive mode, append `bash` at the end of the `docker run` command. For example, to start a base container in interactive mode, use:

```bash
> docker run --tty --interactive rvernica/scidb:16.9 bash
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
root@a86f0f5867dd:/# iquery --afl --query "list('libraries')"
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',16,9,0,229747087,'Release'
{1,0} 'SciDB',16,9,0,229747087,'Release'
root@a86f0f5867dd:/# exit
```

Here is an example for starting and interacting with a detached extended container:

```bash
> docker run --detach rvernica/scidb:16.9-ext
16b699486f2d802d9bd34cf36486d47762b6863a9cd0cb294a9e520dc7f4ef1f
> docker logs 16b699
Starting OpenBSD Secure Shell server: sshd.
Starting PostgreSQL 9.4 database server: main.
Starting shim
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
load = fn(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict){store(input(output_array,input_file,instance_id,format,max_errors,shadow_array,isStrict),output_array)};
sys_create_array_aux = fn(_A_,_E_,_C_){join(aggregate(apply(_A_,_t_,_E_),approxdc(_t_)),build(<values_per_chunk:uint64 null>[i=0:0,1,0],_C_))};
sys_create_array_att = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(_L_,min(_D_),max(_D_),approxdc(_D_)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])};
sys_create_array_dim = fn(_L_,_S_,_D_){redimension(join(build(<n:int64 null,lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null>[No=0:0,1,0],_S_,true),cast(aggregate(apply(aggregate(_L_,count(*),_D_),_t_,_D_),min(_t_),max(_t_),count(*)),<min:int64 null,max:int64 null,count:int64 null>[No=0:0,1,0])),<lo:int64 null,hi:int64 null,ci:int64 null,co:int64 null,min:int64 null,max:int64 null,count:int64 null>[n=0:*,?,0])}
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: Network manager is intialized
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: NetworkManager::run()
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: server-id = 0
2016-12-23 01:55:54,209 [0x7f0e097df880] [DEBUG]: server-instance-id = 0
2016-12-23 01:55:54,212 [0x7f0e097df880] [DEBUG]: Registered instance # 0
2016-12-23 01:55:54,212 [0x7f0e097df880] [INFO ]: SciDB instance. SciDB Version: 16.9.0. Build Type: Release. Commit: db1a98f. Copyright (C) 2008-2015 SciDB, Inc. is exiting.
> docker exec --tty 16b699 iquery --afl --query "load_library('accelerated_io_tools'); list('libraries')"
Query was executed successfully
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',16,9,0,229747087,'Release'
{0,1} 'libaccelerated_io_tools.so',16,9,0,229747087,null
{0,2} 'libdev_tools.so',16,9,0,229747087,null
{1,0} 'SciDB',16,9,0,229747087,'Release'
{1,1} 'libaccelerated_io_tools.so',16,9,0,229747087,null
{1,2} 'libdev_tools.so',16,9,0,229747087,null
```

Here is an example for starting a debian-package-based container in interactive mode:

```bash
> docker run --tty --interactive rvernica/scidb:16.9-deb bash
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
root@2222a680cde1:/# iquery --afl --query "list('libraries')"
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',16,9,0,229747087,'Release'
{1,0} 'SciDB',16,9,0,229747087,'Release'
root@2222a680cde1:/# exit
```

Here is an example for starting a debian-package-based container and Docker volumes for PostgreSQL and SciDB data:

```bash
> docker run --tty --interactive --volume postgres:/var/lib/postgresql/9.4/main --volume scidb:/opt/scidb/16.9/DB-scidb rvernica/scidb:16.9-deb iquery --afl --query "store(build(<val:double>[i=0:1; j=0:1], i*2+j), matrix)"
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
{i,j} val
{0,0} 0
{0,1} 1
{1,0} 2
{1,1} 3
> docker volume ls
DRIVER              VOLUME NAME
local               postgres
local               scidb
> docker run --tty --interactive --volume postgres:/var/lib/postgresql/9.4/main --volume scidb:/opt/scidb/16.9/DB-scidb rvernica/scidb:16.9-deb iquery --afl --query "scan(matrix)"
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.4 database server: main.
Starting shim
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
scidb.py: INFO: Found 0 scidb processes
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 0))
scidb.py: INFO: Starting SciDB server.
scidb.py: INFO: start((server 0 (127.0.0.1) local instance 1))
scidb.py: INFO: Starting SciDB server.
{i,j} val
{0,0} 0
{0,1} 1
{1,0} 2
{1,1} 3
```

# Paradigm4 Plug-ins

The `scidb:XX.YY-ext` images include the folling [Paradigm4](https://github.com/Paradigm4) plug-ins:

* [dev_tools](https://github.com/Paradigm4/dev_tools)
* [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools)
* [equi_join](https://github.com/Paradigm4/equi_join) only in SciDB `15.12` and `16.9`
* [grouped_aggregate](https://github.com/Paradigm4/grouped_aggregate)
* [limit](https://github.com/Paradigm4/limit)
* [stream](https://github.com/Paradigm4/stream) only in SciDB `15.12` and `16.9`
* [summarize](https://github.com/Paradigm4/summarize)
* [superfunpack](https://github.com/Paradigm4/superfunpack)


# Ports Exposed

The image exposes the following ports:

| Port | Application        | Usage                  |
| ---  | ---                | ---                    |
| 1239 | SciDB              | `iquery`               |
| 8080 | SciDB Shim (HTTP)  | http://localhost:8080  |
| 8083 | SciDB Shim (HTTPS) | https://localhost:8080 |


# Build Details

The `scidb:16.9-pre`, `scidb:16.9`, and `scidb:16.9-ext` images are build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB build (version, paths, etc.);
1. Install dependencies from Debian `8` repository;
1. Install `openjdk-8-jdk` from [backports](https://backports.debian.org) repository;
1. Install dependencies from [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) repository;
1. Download SciDB source code from [SciDB Forum](http://forum.paradigm4.com/t/scidb-release-15-7/843);
1. Apply patches required to build SciDB on Debian `8`;
1. Build SciDB libraries;
1. **`scidb:16.9-pre`** is created (necessary due to `2h` time limit for builds on Docker Hub);
1. Build SciDB;
1. Set environment variables for SciDB instance (number of instances, database name, etc.);
1. Setup password-less SSH;
1. Setup PostgreSQL credentials;
1. Install SciDB;
1. Install Shim using `.deb` package provided on Paradigm4 GitHub;
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:16.9`** is created;
1. Install dependencies from Debian `8` repository;
1. Set SHA-1 commit hash for `dev_tools` and `accelerated_io_tools`;
1. Download and build `dev_tools`;
1. Start SciDB;
1. Load `dev_tools` in SciDB and install `accelerated_io_tools` from SciDB;
1. **`scidb:16.9-ext`** is created.

The `scidb:16.9-pkg` image is build as follows:

1. Base image is set to `scidb:16.9`;
1. Install dependencies from Debian `8` repository;
1. Build SciDB `.deb` packages;
1. **`scidb:16.9-pkg`** is created.

Once the SciDB `.deb` packages generated in the `scidb:16.9-pkg` image are uploaded to the [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repository, the `scidb:16.9-deb` image is build as follows:

1. Base image is set to the official [`debian:8`](https://hub.docker.com/_/debian/) image;
1. Set environment variables for SciDB (version, database name, etc.);
1. Install dependencies from Debian `8` repository;
1. Add [Paradigm 4](https://downloads.paradigm4.com/) (Ubuntu `14.04`) and [rvernica/deb](https://bintray.com/rvernica/deb) Bintray repositories;
1. Install SciDB from `.deb` packages;
1. Setup password-less SSH;
1. Setup `config.ini` for SciDB;
1. Setup PostgreSQL credentials;
1. Initialize SciDB (`init-syscat` and `init-all`);
1. Install Shim using `.deb` package provided on Paradigm4 GitHub;
1. Add and setup `ENTRYPOINT` script;
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports;
1. **`scidb:16.9-deb`** is created.
