FROM ubuntu:14.04

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_PROJECT_NAME
ARG CI_BUILD_REF_NAME
ARG CI_BUILD_TIME
ARG CI_BUILD_NUMBER
ARG CI_BUILDER

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_PROJECT_NAME=$CI_PROJECT_NAME CI_BUILD_REF_NAME=$CI_BUILD_REF_NAME CI_BUILD_TIME=$CI_BUILD_TIME \
    CI_BUILD_NUMBER=$CI_BUILD_NUMBER CI_BUILDER=$CI_BUILDER

ENV DOCKER_COMPOSE_VERSION 1.14.0

RUN apt-get update && apt-get install -q -y wget curl; \
    curl -sSL https://get.docker.com/ | sh; \
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose; \
    chmod +x docker-compose; \
    mv docker-compose /usr/local/bin/;


COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
