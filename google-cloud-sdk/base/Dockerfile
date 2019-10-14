ARG UBUNTU_VERSION=18.04
ARG DOCKER_VERSION="latest"
FROM teracy/ubuntu:${UBUNTU_VERSION}-dind-${DOCKER_VERSION}

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
  CI_BUILD_TIME=$CI_BUILD_TIME

# install google-cloud-sdk
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list; \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -; \
  sudo apt-get update && sudo apt-get install google-cloud-sdk; \
  gcloud components install kubectl; \
  # install helm
  curl -LO https://git.io/get_helm.sh; \
  chmod 700 get_helm.sh; \
  ./get_helm.sh; \
  # link installed bin
  # ln -s ${HOME}/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud; \
  # ln -s ${HOME}/google-cloud-sdk/bin/gsutil /usr/local/bin/gsutil; \
  # ln -s ${HOME}/google-cloud-sdk/bin/kubectl /usr/local/bin/kubectl;
