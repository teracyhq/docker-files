# Use the current LTS release as default: https://wiki.debian.org/LTS
ARG DEBIAN_VERSION=stretch

FROM debian:$DEBIAN_VERSION

# An ARG declared before the FROM instruction can’t be used after the FROM
ARG DEBIAN_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# default percona-xtrabackup-80; other possible values: percona-xtrabackup, percona-xtrabackup-24
ARG XTRABACKUP_PACKAGE=percona-xtrabackup-80


RUN apt-get update \
    && apt-get install -y --force-yes \
        apt-transport-https ca-certificates mariadb-client gnupg lsb-release

RUN if [ "$DEBIAN_VERSION" = "buster" ] ; then apt-get install -y ncat  ; else apt-get install -y nmap ; fi

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9334A25F8507EFA5

RUN echo "deb https://repo.percona.com/apt $(lsb_release -sc) main" > /etc/apt/sources.list.d/percona.list

RUN apt-get update \
    && apt-get install -y --force-yes \
        percona-toolkit $XTRABACKUP_PACKAGE qpress
