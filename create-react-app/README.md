# docker-create-react-app


Docker image to work on React projects with `create-react-app` pre-installed


## How to use


Make sure you have the latest Docker version installed on your machine.

```bash
$ mkdir react-app
$ cd react-app
$ docker run -it -v "$PWD":/usr/src -w /usr/src -p "3000:3000" teracy/create-react-app /bin/bash
root@4b15ab7dbf21:/usr/src# create-react-app .
root@4b15ab7dbf21:/usr/src# HOST=0.0.0.0 && npm start
```

And then open http://localhost:3000 or http://\<docker-machine-ip>:3000

See more: https://github.com/facebookincubator/create-react-app


## How to develop



## How to contribute


LICENSE
-------

MIT license. See the LICENSE file.