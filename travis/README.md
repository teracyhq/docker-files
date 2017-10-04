# teracy/travis-build Docker image

teracy/travis-build image for travis-ci runners locally.

## How to use

- To get docker volume mapping work, you should use the below usage example for each specific directory:

```
$ ws
$ cd <project_you_want_to_run>
$ docker run --rm -v $(pwd):/tmp -w /tmp teracy/travis compile > build.sh
```

You will see `build.sh` file in project!