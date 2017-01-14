# teracy/aws-cli Docker image

Docker image to work with Amazon AWS via aws-cli and aws-shell.


# How to use

- Start a container and get a shell with environment variables:

```
$ docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=<YOUR AWS ACCESS KEY ID> \
  -e AWS_SECRET_ACCESS_KEY=<YOUR AWS SCRET ACCESS KEY> \
  -e AWS_DEFAULT_REGION=<YOUR AWS DEFAULT REGION> \
  -v $(pwd):/data \
  teracy/aws-cli /bin/bash
```


- Start a container and get a shell by configuring and reuse the config:

```
$ docker run --rm -it \
  -v ~/.aws:/root/.aws \
  -v $(pwd):/data \
  teracy/aws-cli /bin/bash
root@0d27cd621361:/data# aws configure
```

- To enable auto complete feature for aws-cli after getting the shell:

```
root@0d27cd621361:/data# complete -C /usr/local/bin/aws_completer aws
```

- Start a container and use aws-shell:

```
$ docker run --rm -it \
  -v ~/.aws:/root/.aws \
  -v $(pwd):/data \
  teracy/aws-cli aws-shell
```

And you can use all the supported `aws-cli` or `aws-shell` commands.
