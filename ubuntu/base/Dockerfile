ARG  UBUNTU_VERSION=16.04
FROM ubuntu:$UBUNTU_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME

ARG DOCKER_VERSION="latest"

# Avoid ERROR: unable to initialize frontend
ENV DEBIAN_FRONTEND noninteractive

ADD install.sh ./install.sh
RUN chmod +x ./install.sh
RUN ./install.sh


COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
