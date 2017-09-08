#!/bin/bash
set -ex; \

apt-get update \
&& apt-get install -q -y \
    wget \
    curl \
    python \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
; \
\
# Test version is no support('rc' version)
if [[ "$DOCKER_VERSION" == *"rc"* ]]; then \
    echo >&2 'error: test version is no support'; \
    exit 1; \
fi; \
\
DOCKER_ENGINE_VERSION="$(curl -s https://docs.docker.com/release-notes/docker-engine/ | grep 'h2' | grep "$DOCKER_VERSION" | cut -d '>' -f2 | cut -d '(' -f1 | sed -e 's/[[:space:]]*$//')"; \
\
if [[ "$DOCKER_VERSION" == "latest" ]]; then \
    curl -sSL https://get.docker.com/ | sh; \
else \
    if [[ "$DOCKER_VERSION" != *"ce"* ]] && [[ -n "$DOCKER_ENGINE_VERSION" ]]; then \
        apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D; \
        mkdir -p /etc/apt/sources.list.d; \
        echo "deb https://apt.dockerproject.org/repo ubuntu-`lsb_release -cs` main" | tee /etc/apt/sources.list.d/docker.list; \
        apt-get update; \
        DOCKER_INSTALL_ENGINE_VERSION="$(apt-cache madison docker-engine | grep "$DOCKER_VERSION" | head -1 | cut -d '|' -f2 | grep -o -E '[0-9].*')"; \
        apt-get install -q -y docker-engine=$DOCKER_INSTALL_ENGINE_VERSION; \
    else \
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -; \
        apt-key fingerprint 0EBFCD88; \
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"; \
        apt-get update; \
        if [[ "$DOCKER_VERSION" == *"ce"* ]]; then \
            DOCKER_VERSION=$(echo $DOCKER_VERSION | awk '{gsub(/-/,"~")}1'); \
        fi; \
        \
        INSTALL_VERSION=$(apt-cache madison docker-ce | grep "$DOCKER_VERSION" | head -1 | cut -d '|' -f2 | tr -d '[:space:]'); \
        \
        if [[ -n "$INSTALL_VERSION" ]]; then \
            apt-get install -q -y docker-ce=$INSTALL_VERSION; \
        else \
            echo >&2 "error: unknown '${DOCKER_VERSION}' version"; \
            exit 1; \
        fi; \
        \
    fi; \
    \
fi; \
\
DOCKER_VERSION=$(docker -v | cut -d ',' -f1 | grep -o -E '[0-9].*'); \
DOCKER_COMPOSE_VERSION="$(curl -s https://github.com/docker/toolbox/releases/tag/v$DOCKER_VERSION | grep 'docker-compose' | cut -d '>' -f3 | cut -d '<' -f1)"; \
\
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose; \
chmod +x docker-compose; \
mv docker-compose /usr/local/bin/
