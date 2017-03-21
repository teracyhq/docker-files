# teracy/httpie-jwt-auth Docker image

Docker image for working with http requests using HTTPie and httpie-jwt-auth plugin.


# How to use

There are 2 types of Docker images: Ubuntu and Alpine base, you should use the Alpine base as it's
a very small Docker image unless you really want to use the Ubuntu Docker image base.

```
$ docker container run -it --rm teracy/httpie-jwt-auth:latest-alpine --help
```

or:

```
$ docker container run -it --rm teracy/httpie-jwt-auth:latest --help
```

# Tips

You should use alias for shorter command, for example, add the following line into the
`~/.bash_profile` file:


```
alias http="docker container run -it --rm teracy/httpie-jwt-auth:latest-alpine"
```

and then:

```
$ source ~/.bash_profile # to get alias updated
```

and finally:

```
$ http --help
```

How to use `HTTPie` and `httpie-jwt-auth` plugin, please see:

- https://httpie.org/
- https://travis-ci.org/hoatle/httpie-jwt-auth

Enjoy!
