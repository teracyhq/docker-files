ARG PYTHON_VERSION=2.7
FROM python:$PYTHON_VERSION


LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME

# for aws help: https://github.com/aws/aws-cli/issues/1957
RUN apt-get update \
  && apt-get install -y -qq groff less

RUN pip --no-cache-dir install awscli \
  && mkdir ~/.aws \
  && mkdir -p /mnt/data \
  && pip --no-cache-dir install aws-shell

# TODO(hoatle): add completion support
# $ complete -C '/usr/local/bin/aws_completer' aws
# http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html

WORKDIR /mnt/data

# Expose volume for adding credentials
VOLUME ["~/.aws", "/mnt/data"]
