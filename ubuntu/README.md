# teracy/ubuntu Docker image

Ubuntu Docker in Docker image for gitlab-ci runners.


## How to use

- Use teracy/ubuntu image:
Tagging convention: `teracy/ubuntu:<platform_version>-dind-<docker_version>`.
For example: `teracy/ubuntu:16.04-dind-17.06.0-ce`.


- To get docker volume mapping work, you should use the below usage example for each specific directory


Docker in Docker (DinD):

```
$ docker run --privileged --name docker -d -v $(pwd):$(pwd) -w $(pwd) docker:17.06.0-dind
$ docker run --rm -it --link docker -v $(pwd):$(pwd) -w $(pwd) teracy/ubuntu:16.04-dind-17.06.0-ce bash
# pwd
/builds/project
# docker version
Client:
 Version:      17.06.0-ce
 API version:  1.30
 Go version:   go1.8.3
 Git commit:   02c1d87
 Built:        Fri Jun 23 21:19:16 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.06.0-ce
 API version:  1.30 (minimum version 1.12)
 Go version:   go1.8.3
 Git commit:   02c1d87
 Built:        Fri Jun 23 21:51:55 2017
 OS/Arch:      linux/amd64
 Experimental: false
# docker-compose version
docker-compose version 1.14.0, build c7bdf9e
docker-py version: 2.3.0
CPython version: 2.7.13
OpenSSL version: OpenSSL 1.0.1t  3 May 2016
#
```

Docker outside of Docker (DooD):

```
$ docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/$(pwd) -w $(pwd) teracy/ubuntu:16.04-dind-17.06.0-ce bash
# docker version
Client:
 Version:      17.06.0-ce
 API version:  1.30
 Go version:   go1.8.3
 Git commit:   02c1d87
 Built:        Fri Jun 23 21:19:16 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.06.0-ce
 API version:  1.30 (minimum version 1.12)
 Go version:   go1.8.3
 Git commit:   02c1d87
 Built:        Fri Jun 23 21:19:04 2017
 OS/Arch:      linux/amd64
 Experimental: false
# docker-compose version
docker-compose version 1.14.0, build c7bdf9e
docker-py version: 2.3.0
CPython version: 2.7.13
OpenSSL version: OpenSSL 1.0.1t  3 May 2016
#
```

## How to build

- Fork this project into your personal account (it's recommened to renamed your forked repo to `teracy-docker-files`) and then clone it into the workspace directory:

  ```bash
  $ cd ~/teracy-dev/workspace
  $ git checkout <your_forked_repo>
  $ cd teracy-docker-files
  $ git remote add upstream git@github.com:teracyhq/docker-files.git
  ```

- `$ vagrant reload --provision` to update the dev-setup from this project into the teracy-dev's VM.

```bash
$ ws
$ cd teracy-docker-files/ubuntu/base/
```

Build a default ubuntu version with the default (latest) docker version:

```bash
$ docker build -t teracy/ubuntu:16.04-dind-latest .
```

Build a specific ubuntu version with a specific docker version:

```bash
$ docker build -t teracy/ubuntu:14.04-dind-17.05.0-ce --build-arg UBUNTU_VERSION=14.04 --build-arg DOCKER_VERSION=17.05.0-ce .
```

## How to contribute


LICENSE
-------

MIT license. See the LICENSE file.
