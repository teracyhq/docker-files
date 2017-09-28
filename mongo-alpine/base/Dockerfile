ARG ALPINE_VERSION=edge

FROM alpine:$ALPINE_VERSION

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

# thanks to: https://github.com/mvertes/docker-alpine-mongo/blob/master/Dockerfile

RUN \
echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk add --no-cache mongodb && \
rm -f /usr/bin/mongosniff /usr/bin/mongoperf

VOLUME /data/db

EXPOSE 27017 28017

COPY run.sh /root

ENTRYPOINT ["/root/run.sh"]

CMD ["mongod"]
