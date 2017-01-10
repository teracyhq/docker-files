# Teracy docker-files [![Build Status](https://travis-ci.org/teracyhq/docker-files.svg?branch=master)](https://travis-ci.org/teracyhq/docker-files)

Teracy project to create Docker images.

## How to use

Follow README.md files located at each Docker image directories.


## How to contribute

- Fork this repo (it's recommened to renamed your forked repo to `teracy-docker-files`)

- Register your account at https://travis-ci.org and enable `teracy-docker-files` repo

- Add the following settings to the travis-ci repo:

    + `DOCKER_USER` for the user or organization Docker namespace
    + `DOCKER_USERNAME` for the username of the Docker Hub
    + `DOCKER_PASSWORD` for the password of the Docker Hub
    + `IMG_REPO_PREFIX` is optional

  See .travis.yml for details

- Start creating new Docker images to be shared within our community


# LICENSE

MIT license. More details on the LICENSE file.
