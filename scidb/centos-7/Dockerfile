FROM centos:7

# Setup SystemD
ENV container=docker
RUN ( cd /lib/systemd/system/sysinit.target.wants/                              \
        ;  for i in *                                                           \
        ;  do [ $i == systemd-tmpfiles-setup.service ]                          \
        || rm --force $i                                                        \
        ;  done )                                                               \
        ;  rm --force /lib/systemd/system/multi-user.target.wants/*             \
        ;  rm --force /etc/systemd/system/*.wants/*                             \
        ;  rm --force /lib/systemd/system/local-fs.target.wants/*               \
        ;  rm --force /lib/systemd/system/sockets.target.wants/*udev*           \
        ;  rm --force /lib/systemd/system/sockets.target.wants/*initctl*        \
        ;  rm --force /lib/systemd/system/basic.target.wants/*                  \
        ;  rm --force /lib/systemd/system/anaconda.target.wants/*
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
# Usage: docker run --volume /sys/fs/cgroup:/sys/fs/cgroup:ro

# Setup container environment
COPY res/bashrc /tmp/
RUN cat /tmp/bashrc                             \
        >> /root/.bashrc

# Setup additional repositories
RUN yum-config-manager --add-repo                                                               \
        https://yum.repos.intel.com/mkl/setup/intel-mkl.repo                                    \
        && rpm --import                                                                         \
            https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
ENV YUM="yum install --assumeyes --setopt=skip_missing_names_on_install=False"
RUN $YUM                                        \
        epel-release                            \
        https://download.postgresql.org/pub/repos/yum/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-3.noarch.rpm \
        https://downloads.paradigm4.com/devtoolset-3/centos/7/sclo/x86_64/rh/devtoolset-3/scidb-devtoolset-3.noarch.rpm

# Install SciDB dependencies
RUN $YUM                                        \
        environment-modules                     \
        epel-release                            \
        devtoolset-3-toolchain                  \
        gcc                                     \
        git                                     \
        intel-mkl-2019.1-053                    \
        lapack                                  \
        libcsv                                  \
        libedit                                 \
        libpqxx                                 \
        libtomcrypt                             \
        libxslt                                 \
        log4cxx                                 \
        log4cxx-devel                           \
        openssh-clients                         \
        openssh-server                          \
        openssl-devel                           \
        perl                                    \
        postgresql93                            \
        postgresql93-contrib                    \
        postgresql93-server                     \
        protobuf                                \
        protobuf-devel                          \
        python-paramiko                         \
        python2-crypto                          \
        redhat-lsb-core                         \
        uuid                                    \
        wget                                    \
        which                                   \
        yum-utils                               \
        && yum clean all

# Setup container environment
EXPOSE 1239 8080 8083
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
ENV SCIDB_VER=19.11 \
        PATH=$PATH:/opt/scidb/19.11/bin

# Copy SciDB configuration
COPY res/init-scidb.sh /root/
COPY res/config.ini /root/
