FROM debian:jessie

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_PROJECT_NAME
ARG CI_BUILD_REF_NAME
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_PROJECT_NAME=$CI_PROJECT_NAME CI_BUILD_REF_NAME=$CI_BUILD_REF_NAME CI_BUILD_TIME=$CI_BUILD_TIME

ARG packer_dist=https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip

RUN cd /tmp \
  && apt-get update && apt-get install wget unzip -f -y \
  && wget $packer_dist \
  && unzip packer* \
  && mv packer /usr/local/bin \
  && rm packer*

ENTRYPOINT ["packer"]
