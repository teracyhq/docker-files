# teracy/packer Docker image

Docker image to use `packer` (https://www.packer.io/)


## How to use

```
$ docker run --rm -it -v $(pwd):/usr/src -w /usr/src teracy/packer --help
usage: packer [--version] [--help] <command> [<args>]

Available commands are:
    build       build image(s) from template
    fix         fixes templates from old versions of packer
    inspect     see components of a template
    push        push a template and supporting files to a Packer build service
    validate    check that a template is valid
    version     Prints the Packer version


```

For example:

```
$ docker run --rm -it -v $(pwd):/usr/src -w /usr/src teracy/packer validate example.json
```
