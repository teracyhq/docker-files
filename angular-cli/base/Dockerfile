ARG NODE_VERSION=8
FROM node:$NODE_VERSION

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info

ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME
ARG NG_CLI_VERSION=latest

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
  CI_BUILD_TIME=$CI_BUILD_TIME \
  NG_CLI_VERSION=$NG_CLI_VERSION

# credits to https://github.com/emmenko/docker-nodejs-karma

RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  hicolor-icon-theme \
  libcanberra-gtk* \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  libv4l-0 \
  fonts-symbola \
  --no-install-recommends \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
  && apt-get update && apt-get install -y \
  xvfb google-chrome-stable \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD xvfb.sh /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /etc/init.d/xvfb \
  && chmod +x /entrypoint.sh

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

RUN yarn global add @angular/cli@$NG_CLI_VERSION && rm -rf $(yarn cache dir)

ENTRYPOINT ["/entrypoint.sh"]
