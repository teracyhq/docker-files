# teracy/jenkins-dod Docker Image

Jenkins Docker outside (of) Docker (DoD) image.

Thanks to: http://container-solutions.com/running-docker-in-jenkins-in-docker/

You can choose running Jenkins with the 2 modes below.

**Note:**
- Make sure the host should have `docker` and `docker-compose` available.
- You can skip `docker-compose` by removing the volume mapping of `docker-compose`

## 1. docker running with sudo required

```
$ sudo mkdir -p /var/jenkins_home && sudo chown -R $(whoami) /var/jenkins_home
$ docker container run -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-v $(which docker-compose):/usr/bin/docker-compose \
-v /var/jenkins_home:/var/jenkins_home \
-p 8080:8080 teracy/jenkins-dod
$ docker logs -f jenkins
```

Open \<vm_ip_address>:8080 to start using Jenkins.


## 2. docker running without sudo required

### Build

so that we can use docker without sudo, this build step is required as docker group is is dynamic
for each Docker host.

```
# clone this repo and cd jenkins-dood/build
# or create Dockerfile and copy the content from jenkins-dod/build/Dockerfile
$ docker image build \
--build-arg DOCKER_GROUP_ID=$(getent group docker | awk -F: '{printf "%d\n", $3}') \
-t teracy/jenkins-dod-build .
```

### Run

```
$ sudo mkdir -p /var/jenkins_home && sudo chown -R $(whoami) /var/jenkins_home
$ docker container run -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-v $(which docker-compose):/usr/bin/docker-compose \
-v /var/jenkins_home:/var/jenkins_home \
-p 8080:8080 teracy/jenkins-dod-build
$ docker logs -f jenkins
```

Open \<vm_ip_address>:8080 to start using Jenkins.

## See more

- https://jenkins.io/doc/
- https://hub.docker.com/_/jenkins/
