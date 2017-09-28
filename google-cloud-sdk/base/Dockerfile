ARG UBUNTU_VERSION=16.04
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
RUN export PATH=$PATH:${HOME}/google-cloud-sdk/bin; \
    export CLOUDSDK_CORE_DISABLE_PROMPTS=1; \
    curl https://sdk.cloud.google.com | bash; \
    gcloud components install kubectl; \
    # install helm
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash; \
    # link installed bin
    ln -s ${HOME}/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud; \
    ln -s ${HOME}/google-cloud-sdk/bin/gsutil /usr/local/bin/gsutil; \
    ln -s ${HOME}/google-cloud-sdk/bin/kubectl /usr/local/bin/kubectl;
