ARG PYTHON_VERSION=2.7-alpine
FROM python:${PYTHON_VERSION}

LABEL authors="hoatle <hoatle@teracy.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info

ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME
ARG HTTPIE_JWT_AUTH_VERSION

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME \
    HTTPIE_JWT_AUTH_VERSION=$HTTPIE_JWT_AUTH_VERSION

RUN pip install httpie # the latest version
RUN pip install httpie-jwt-auth==$HTTPIE_JWT_AUTH_VERSION

ENTRYPOINT ["http"]
