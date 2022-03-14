ARG DEBIAN_VERSION=buster

FROM debian:$DEBIAN_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# percona-xtrabackup-24, percona-xtrabackup-80
ARG XTRABACKUP_PACKAGE=percona-xtrabackup-24

RUN apt-get update \
    && apt-get install -y --force-yes \
        apt-transport-https ca-certificates mariadb-client nmap gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9334A25F8507EFA5

RUN echo 'deb https://repo.percona.com/apt buster main' > /etc/apt/sources.list.d/percona.list

RUN apt-get update \
    && apt-get install -y --force-yes \
        percona-toolkit $XTRABACKUP_PACKAGE qpress