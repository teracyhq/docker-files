ARG DEBIAN_VERSION=bullseye

FROM debian:$DEBIAN_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME

ARG PACKER_VERSION=1.8.0

ARG PACKER_DIST=https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip

RUN cd /tmp \
  && apt-get update && apt-get install wget unzip -f -y \
  && wget $PACKER_DIST \
  && unzip packer* \
  && mv packer /usr/local/bin \
  && rm packer*

ENTRYPOINT ["packer"]

CMD ["--help"]
