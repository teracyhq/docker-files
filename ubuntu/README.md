# teracy/ubuntu Docker image

Ubuntu Docker in Docker image for gitlab-ci runners.


## How to use

Docker in Docker (DinD):

```
$ docker run --privileged --name docker -d docker:dind
$ docker run --rm -it --link docker -v $(pwd):/builds/project -w /builds/project teracy/ubuntu:14.04-dind sh
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
$ docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/builds/project -w /builds/project  teracy/ubuntu:14.04-dind sh
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

## How to develop


## How to contribute


LICENSE
-------

MIT license. See the LICENSE file.
