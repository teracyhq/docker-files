ARG DEBIAN_VERSION=jessie

FROM debian:$DEBIAN_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# default (2.3.10); other possible values: percona-xtrabackup-22, percona-xtrabackup-24
ARG XTRABACKUP_PACKAGE=percona-xtrabackup

RUN apt-get update \
    && apt-get install -y --force-yes \
        apt-transport-https ca-certificates mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 9334A25F8507EFA5

RUN echo 'deb https://repo.percona.com/apt jessie main' > /etc/apt/sources.list.d/percona.list

RUN apt-get update \
    && apt-get install -y --force-yes \
        percona-toolkit $XTRABACKUP_PACKAGE qpress
