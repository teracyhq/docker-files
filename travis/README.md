# teracy/travis Docker image

teracy/travis image that has `travis` and `travis-build` included so that you can use `travis` along
with `travis compile`.

## How to use

- To get docker volume mapping work, you should use the below usage example for each specific directory:

```
$ cd <project_you_want_to_run> # make sure it's a git repo
$ docker run --rm -v $(pwd):/tmp -w /tmp teracy/travis compile > build.sh
```

You will see the generated `build.sh` file in the project!
