ARG DEBIAN_VERSION=stretch

FROM debian:$DEBIAN_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# default (2.3.10); other possible values: percona-xtrabackup-24, percona-xtrabackup-80
ARG XTRABACKUP_PACKAGE=percona-xtrabackup

RUN apt-get update \
    && apt-get install -y --force-yes \
        apt-transport-https ca-certificates mariadb-client nmap gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9334A25F8507EFA5

RUN echo 'deb https://repo.percona.com/apt $DEBIAN_VERSION main' > /etc/apt/sources.list.d/percona.list

RUN apt-get update \
    && apt-get install -y --force-yes \
        percona-toolkit $XTRABACKUP_PACKAGE qpress