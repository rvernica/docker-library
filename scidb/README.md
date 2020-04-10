# SciDB

   * Dockerfile for [SciDB DBMS](http://www.paradigm4.com/)
   * Built on top of [Debian](https://www.debian.org/),
     [Ubuntu](https://www.ubntu.com/) or
     [CentOS](https://www.centos.org/) Linux
   * Size: `~3GB`
   * Latest version: `19.11`
   * Automated build at
     [Docker Hub](https://hub.docker.com/r/rvernica/scidb/)
     [![](https://images.microbadger.com/badges/version/rvernica/scidb.svg)](https://microbadger.com/images/rvernica/scidb)


# Tags

Different tags are available depending on the SciDB version and the
base operating system.


## `19.11`

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:19.11`](https://github.com/rvernica/docker-library/blob/master/scidb/19.11/Dockerfile)                           | `debian:9`             | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.11.svg)](https://microbadger.com/images/rvernica/scidb:19.11)                           | `2.93GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.11-xenial`](https://github.com/rvernica/docker-library/blob/master/scidb/19.11/Dockerfile.xenial)             | `ubuntu:16.04`         | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.11-xenial.svg)](https://microbadger.com/images/rvernica/scidb:19.11-xenial)             | `2.82GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.11-centos-7`](https://github.com/rvernica/docker-library/blob/master/scidb/19.11/Dockerfile.centos-7)         | `centos:7`             | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.11-centos-7.svg)](https://microbadger.com/images/rvernica/scidb:19.11-centos-7)         | `4.04GB` | SciDB
| [`scidb:19.11-centos-7-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/19.11/Dockerfile.centos-7-ext) | `scidb:19.11-centos-7` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.11-centos-7-ext.svg)](https://microbadger.com/images/rvernica/scidb:19.11-centos-7-ext) | `4.48GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))


## `19.3`

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:19.3`](https://github.com/rvernica/docker-library/blob/master/scidb/19.3/Dockerfile)                   | `debian:8`          | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.3.svg)](https://microbadger.com/images/rvernica/scidb:19.3)                   | `3.51GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.3-trusty`](https://github.com/rvernica/docker-library/blob/master/scidb/19.3/Dockerfile.trusty)     | `ubuntu:14.04`      | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.3-trusty.svg)](https://microbadger.com/images/rvernica/scidb:19.3-trusty)     | `3.54GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.3-centos-6`](https://github.com/rvernica/docker-library/blob/master/scidb/19.3/Dockerfile.centos-6) | `centos:6`          | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.3-centos-6.svg)](https://microbadger.com/images/rvernica/scidb:19.3-centos-6) | `4.25GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.3-centos-7`](https://github.com/rvernica/docker-library/blob/master/scidb/19.3/Dockerfile.centos-7) | `centos:7`          | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.3-centos-7.svg)](https://microbadger.com/images/rvernica/scidb:19.3-centos-7) | `3.8GB`  | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:19.3-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/19.3/Dockerfile.ext)           | `scidb:19.3-trusty` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:19.3-ext.svg)](https://microbadger.com/images/rvernica/scidb:19.3-ext)           | `3.91GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))


## `18.1`

The tags intended for the end user are:

| Tag | From | Download Size | Image Size | Comments |
| --- | ---  | ---           | ---:       | ---      |
| [`scidb:18.1`](https://github.com/rvernica/docker-library/blob/master/scidb/18.1/Dockerfile)                   | `debian:8`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:18.1.svg)](https://microbadger.com/images/rvernica/scidb:18.1)                   |  `750MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:18.1-trusty`](https://github.com/rvernica/docker-library/blob/master/scidb/18.1/Dockerfile.trusty)     | `ubuntu:14.04` | [![](https://images.microbadger.com/badges/image/rvernica/scidb:18.1-trusty.svg)](https://microbadger.com/images/rvernica/scidb:18.1-trusty)     |  `818MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:18.1-centos-6`](https://github.com/rvernica/docker-library/blob/master/scidb/18.1/Dockerfile.centos-6) | `centos:6`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:18.1-centos-6.svg)](https://microbadger.com/images/rvernica/scidb:18.1-centos-6) |  `841MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:18.1-centos-7`](https://github.com/rvernica/docker-library/blob/master/scidb/18.1/Dockerfile.centos-7) | `centos:7`     | [![](https://images.microbadger.com/badges/image/rvernica/scidb:18.1-centos-7.svg)](https://microbadger.com/images/rvernica/scidb:18.1-centos-7) |  `477MB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim))
| [`scidb:18.1-ext`](https://github.com/rvernica/docker-library/blob/master/scidb/18.1/Dockerfile.ext)           | `scidb:18.1`   | [![](https://images.microbadger.com/badges/image/rvernica/scidb:18.1-ext.svg)](https://microbadger.com/images/rvernica/scidb:18.1-ext)           | `1.04GB` | SciDB (w/ [Shim](https://github.com/Paradigm4/shim) and [Paradigm4 plug-ins](#paradigm4-plug-ins))

The `-deb`, `-pre`, and `-pkg` tags are no longer required for version `18.1` or newer since Debian packages are directly provided by Paradigm4. Hence `scidb:18.1` is equivalent with the older `-deb` tags.


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

When started, the images use an
[`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#/entrypoint)
script to start the required services and SciDB. The start-up
procedure for CentOS 7 containers is slightly different and is
covered at the end of this section

Here is how an interactive container can be started:
```bash
$ docker run --tty --interactive rvernica/scidb:19.11 bash
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.3 database server: main.
shim: SciDB HTTP service started on port(s) 8080,8083s with web root
[/var/lib/shim/wwwroot], talking to SciDB on port 1239
[scidbctl] Starting SciDB cluster scidb ...
[scidbctl-0-1-scidb] Starting s0-i1 on server 127.0.0.1
[scidbctl-0-0-scidb] Starting s0-i0 on server 127.0.0.1
[scidbctl] Started 2 instances, waiting up to 30 seconds for cluster sync
[scidbctl] Cluster is ready
root@427e72228cf3:/#
```
In the example above, `bash` is provided as an extra argument to the
`ENTRYPOINT` script and it is ran once the container is
initialized. Once the container is started SciDB is ready to execute
queries:

```bash
root@427e72228cf3:/# iquery --afl
AFL% list('instances');
{No} name,port,instance_id,online_since,instance_path
{0} '127.0.0.1',1239,0,'2020-04-10 16:58:12','/opt/scidb/19.11/DB-scidb/0/0'
{1} '127.0.0.1',1240,1,'2020-04-10 16:58:12','/opt/scidb/19.11/DB-scidb/0/1'
```
When the container is stopped, an attempt is made to cleanly shutdown
SciDB and PostgreSQL. A more common way to start a container is in the
detached mode. Moreover, the `Shim` port can be mapped on the host:
```bash
$ docker run --detach --name scidb --publish 8080:8080 rvernica/scidb:19.11
```
Queries can be ran by executing commands in the container:
```bash
$ docker exec scidb iquery --afl --query "list('instances')"
{No} name,port,instance_id,online_since,instance_path
{0} '127.0.0.1',1239,0,'2020-04-10 16:58:12','/opt/scidb/19.11/DB-scidb/0/0'
{1} '127.0.0.1',1240,1,'2020-04-10 16:58:12','/opt/scidb/19.11/DB-scidb/0/1'
```
Moreover, Shim is also accessible to client libraries like
[`SciDB-Py`](https://github.com/paradigm4/scidb-py) or
[`SciDBR`](https://github.com/paradigm4/scidbr):

```bash
> curl http://localhost:8080/version
19.11.3
```
The SciDB logs can be accessed using the Docker `logs` command:
```bash
$ docker logs scidb
Starting OpenBSD Secure Shell server: sshd.
Starting PostgreSQL 9.3 database server: main.
[scidbctl] Starting SciDB cluster scidb ...
[scidbctl-0-0-scidb] Starting s0-i0 on server 127.0.0.1
[scidbctl-0-1-scidb] Starting s0-i1 on server 127.0.0.1
[scidbctl] Started 2 instances, waiting up to 30 seconds for cluster sync
[scidbctl] Cluster is ready
ccm-read-time-out : 10
diskindex-renumber-ebm : 1

2020-04-10 16:58:11.000158 [0x7f91fea5fe80] [INFO ]: The SciDB process does not do perf wait timing.
2020-04-10 16:58:11.000492 [0x7f91fea5fe80] [WARN ]: Ignoring io-paths-list config.ini entry "" (""): Not an absolute path
2020-04-10 16:58:11.000516 [0x7f91fea5fe80] [INFO ]: Stopping CcmService
2020-04-10 16:58:11.000516 [0x7f91fea5fe80] [INFO ]: SciDB instance. SciDB Version: 19.11.3.
```
Finally, we can use Docker volumes to save SciDB data between containers.
```bash
$ docker run --rm --tty --interactive                                               \
    --volume postgres:/var/lib/postgresql/9.3/main                                  \
    --volume scidb:/opt/scidb/19.11/DB-scidb                                        \
    rvernica/scidb:19.11                                                            \
    iquery --afl --query "store(build(<val:double>[i=0:1; j=0:1], i*2+j), matrix);  \
                          scan(matrix)"
[ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.3 database server: main.
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
[scidbctl] Starting SciDB cluster scidb ...
[scidbctl-0-0-scidb] Starting s0-i0 on server 127.0.0.1
[scidbctl-0-1-scidb] Starting s0-i1 on server 127.0.0.1
[scidbctl] Started 2 instances, waiting up to 30 seconds for cluster sync
[scidbctl] Cluster is ready
Query was executed successfully
{i,j} val
{0,0} 0
{0,1} 1
{1,0} 2
{1,1} 3
```
Now that container is removed but the volumes are still present:
```bash
$ docker volume ls
DRIVER              VOLUME NAME
local               postgres
local               scidb
```
So, we can start a new container using the existing data volumes:
```bash
$ docker run --rm --tty --interactive               \
    --volume postgres:/var/lib/postgresql/9.3/main  \
    --volume scidb:/opt/scidb/19.11/DB-scidb        \
    rvernica/scidb:19.11                            \
    iquery --afl --query "scan(matrix)"
  [ ok ] Starting OpenBSD Secure Shell server: sshd.
[ ok ] Starting PostgreSQL 9.3 database server: main.
shim: SciDB HTTP service started on port(s) 8080,8083s with web root [/var/lib/shim/wwwroot], talking to SciDB on port 1239
[scidbctl] Starting SciDB cluster scidb ...
[scidbctl-0-0-scidb] Starting s0-i0 on server 127.0.0.1
[scidbctl-0-1-scidb] Starting s0-i1 on server 127.0.0.1
[scidbctl] Started 2 instances, waiting up to 30 seconds for cluster sync
[scidbctl] Cluster is ready
{i,j} val
{0,0} 0
{0,1} 1
{1,0} 2
{1,1} 3
```

## CentOS 7

The CentOS 7 based containers require a special start-up procedure due
to the `systemd` infrastructure. The can only be started in the
background and require additional volumes:
```bash
$ docker run --detach --name scidb              \
    --volume /sys/fs/cgroup:/sys/fs/cgroup:ro   \
    --volume /tmp/$(mktemp --directory):/run    \
    rvernica/scidb:19.11-centos-7
```
Next, SciDB needs to be started in the container:
```bash
$ docker exec --tty --interactive scidb bash

[root@a9a1ba7cbe19 /]# /opt/scidb/19.11/bin/scidbctl.py start scidb
[scidbctl] Starting SciDB cluster scidb ...
[scidbctl-0-0-scidb] Starting s0-i0 on server 127.0.0.1
[scidbctl-0-1-scidb] Starting s0-i1 on server 127.0.0.1
[scidbctl] Started 2 instances, waiting up to 30 seconds for cluster sync
[scidbctl] Cluster is ready

[root@a9a1ba7cbe19 /]# iquery --afl --query "list('instances')"
{No} name,port,instance_id,online_since,instance_path
{0} '127.0.0.1',1239,0,'2020-04-10 17:25:39','/opt/scidb/19.11/DB-scidb/0/0'
{1} '127.0.0.1',1240,1,'2020-04-10 17:25:39','/opt/scidb/19.11/DB-scidb/0/1'
```
If the extended image is used (i.e., `scidb:19.11-centos-7-ext`), the
Paradigm4 Plug-ins (discussed next) are available in the container:
```bash
$ docker run --detach --name scidb              \
    --volume /sys/fs/cgroup:/sys/fs/cgroup:ro   \
    --volume /tmp/$(mktemp --directory):/run    \
    rvernica/scidb:19.11-centos-7-ext

$ docker exec --tty --interactive scidb bash
[root@ee4d4e165294 /]# /opt/scidb/19.11/bin/scidbctl.py start scidb
...

[root@ee4d4e165294 /]# iquery --afl --query "list('libraries')"
{inst,n} name,major,minor,patch,build,build_type
{0,0} 'SciDB',19,11,3,242601238,'RelWithDebInfo'
{0,1} 'libaccelerated_io_tools.so',19,11,3,242601238,null
{0,2} 'libequi_join.so',19,11,3,242601238,null
{0,3} 'libgrouped_aggregate.so',19,11,3,242601238,null
{0,4} 'libstream.so',19,11,3,242601238,null
{0,5} 'libsuperfunpack.so',19,11,3,242601238,null
{1,0} 'SciDB',19,11,3,242601238,'RelWithDebInfo'
{1,1} 'libaccelerated_io_tools.so',19,11,3,242601238,null
{1,2} 'libequi_join.so',19,11,3,242601238,null
{1,3} 'libgrouped_aggregate.so',19,11,3,242601238,null
{1,4} 'libstream.so',19,11,3,242601238,null
{1,5} 'libsuperfunpack.so',19,11,3,242601238,null
```

# Paradigm4 Plug-ins

The `scidb:*-ext` images include the following [Paradigm4](https://github.com/Paradigm4) plug-ins:

* [dev_tools](https://github.com/Paradigm4/dev_tools) < `19.3`
* [accelerated_io_tools](https://github.com/Paradigm4/accelerated_io_tools)
* [equi_join](https://github.com/Paradigm4/equi_join) only in SciDB > `15.7`
* [grouped_aggregate](https://github.com/Paradigm4/grouped_aggregate)
* [limit](https://github.com/Paradigm4/limit) only in SciDB < `18.1`
* [stream](https://github.com/Paradigm4/stream) only in SciDB > `15.7`
* [summarize](https://github.com/Paradigm4/summarize) only in SciDB < `18.1`
* [superfunpack](https://github.com/Paradigm4/superfunpack)


# Ports Exposed

The image exposes the following ports:

| Port | Application        | Usage                  |
| ---  | ---                | ---                    |
| 1239 | SciDB              | `iquery`               |
| 8080 | SciDB Shim (HTTP)  | http://localhost:8080  |
| 8083 | SciDB Shim (HTTPS) | https://localhost:8080 |


# Build Details

Generally the images are built as follows:

1. Base image is set to an official Linux distribution image, e.g.,
   [`ubuntu:16.04`](https://hub.docker.com/_/ubuntu),
   [`centos:7`](https://hub.docker.com/_/centos)
1. Set environment variables for SciDB build (version, paths, etc.)
1. If necessary, set container for running `systemd` services (required for Shim)
1. Install various installation dependencies
1. Download official SciDB install script `install-scidb-ce.sh`
1. If necessary, patch the SciDB install script
1. Run SciDB install script. This will add various repositories and
   install a significant number of packages, including SciDB. This is
   the main step of the build process.
1. Setup SSH (required by SciDB)
1. Setup SciDB config file, `config.ini`
1. Setup PostgreSQL and initialize SciDB cluster
1. Download, compile, and install Shim
1. Add and setup `ENTRYPOINT` script
1. Expose SciDB (`1239`) and Shim (`8080` and `8083`) ports
