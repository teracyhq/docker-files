# Teracy docker-files [![Build, Push Docker Images](https://github.com/teracyhq/docker-files/actions/workflows/build-push.yaml/badge.svg)](https://github.com/teracyhq/docker-files/actions/workflows/build-push.yaml)


Teracy project to create Docker images.

## How to use

Follow README.md files located at each Docker image directories.

- Push to multiple docker registries:
    + By default, built docker images will be pushed to the github container registry: `ghcr.io/${GITHUB_REPOSITORY}`
    + To add more docker registries, you need to add `REGISTRIES` secret environment variable on github actions,
      for example: `ghcr.io/teracyhq/docker-files, docker.io/teracy`
    + Make sure to configure authorization for the configured registries, see more:
      https://github.com/teracyhq-incubator/.github#docker-multiple-login and
      https://github.com/teracyhq-incubator/.github#docker-build-push-sign

- Docker image name prefix:
    + Sometimes you need to add prefix to the docker image
    + For example, by default, `ghcr.io/teracyhq/docker-files/ubuntu`, you can change to
      `ghcr.io/teracyhq/docker-files/teracy-ubuntu` by setting `IMG_NAME_PREFIX` secret environment variable on github actions
      to `teracy-`
  
- Enable/disable docker push:
    + By default, docker images will be pushed when new commits are pushed to the master branch
    + To disable the docker push, set `PUSH_ENABLED` secret environment variable to `false`

## How to contribute

- Fork this repo (it's recommened to renamed your forked repo to `teracy-docker-files`)

- Start creating new Docker images to be shared within our community


# LICENSE

MIT license. More details on the LICENSE file.
