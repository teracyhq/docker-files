ARG RUBY_VERSION=2.3.4
FROM ruby:${RUBY_VERSION}

LABEL authors="hieptranquoc <hieptq8888@gmail.com>"

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME

ARG BRANCH_NAME="master"

RUN mkdir -p $HOME/builds

RUN cd $HOME/builds; \
    git clone --depth=1 --branch=${BRANCH_NAME} https://github.com/travis-ci/travis-build.git; \
    cd travis-build; \
    gem install travis; \
    printf "y" | travis; \
    ln -s `pwd` ~/.travis/travis-build; \
    bundle install --gemfile ~/.travis/travis-build/Gemfile; \
    bundler binstubs travis

ENTRYPOINT [ "travis" ]
CMD [ "-h" ]
