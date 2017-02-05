teracy/angular-cli Docker image
===============================

Docker image to work on Angular projects with angular-cli, google-chrome pre-installed


How to use
----------

Make sure you have the latest Docker version installed on your machine.

```bash
$ mkdir new-ng2-app
$ cd new-ng2-app
$ docker run -it -v $(pwd):/usr/src -w /usr/src hoatle/teracy-angular-cli /bin/bash
Starting virtual X frame buffer: Xvfb.
Executing command /bin/bash
root@4b15ab7dbf21:/usr/src# ng --version

                             _                           _  _
  __ _  _ __    __ _  _   _ | |  __ _  _ __         ___ | |(_)
 / _` || '_ \  / _` || | | || | / _` || '__|_____  / __|| || |
| (_| || | | || (_| || |_| || || (_| || |  |_____|| (__ | || |
 \__,_||_| |_| \__, | \__,_||_| \__,_||_|          \___||_||_|
               |___/
@angular/cli: 1.0.0-beta.30
node: 6.9.5
os: linux x64
root@4b15ab7dbf21:/usr/src# ng init --name hello --style scss -sn
root@4b15ab7dbf21:/usr/src# npm install
root@4b15ab7dbf21:/usr/src# ng serve
```

For better developer experience with best practices, please follow this blog post:

http://blog.teracy.com/2016/09/22/how-to-develop-angular-2-applications-easily-with-docker-and-angular-cli/

and use this: https://github.com/teracyhq/angular-boilerplate


How to develop
--------------


How to contribute
-----------------


LICENSE
-------

MIT license. See the LICENSE file.
