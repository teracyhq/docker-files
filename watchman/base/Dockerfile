ARG UBUNTU_VERSION=16.04
FROM ubuntu:${UBUNTU_VERSION}

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info

ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME
ARG WATCHMAN_VERSION=v4.9.0

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME \
    WATCHMAN_VERSION=$WATCHMAN_VERSION

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/facebook/watchman.git
WORKDIR watchman/
RUN git checkout $WATCHMAN_VERSION
RUN apt-get install -y autoconf automake build-essential python-dev libssl-dev libtool pkg-config
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
# clean up the source
RUN cd .. && rm -rf watchman
WORKDIR /
