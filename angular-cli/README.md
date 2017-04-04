teracy/angular-cli Docker image
===============================

Docker image to work on Angular projects with angular-cli, google-chrome pre-installed


How to use
----------

Make sure you have the latest Docker version installed on your machine.

```bash
$ docker container run --rm -it -v $(pwd):/opt -w /opt teracy/angular-cli /bin/bash
Starting virtual X frame buffer: Xvfb.
Executing command /bin/bash
root@265dcf6e7241:/opt# ng --version
    _                      _                 ____ _     ___
   / \   _ __   __ _ _   _| | __ _ _ __     / ___| |   |_ _|
  / △ \ | '_ \ / _` | | | | |/ _` | '__|   | |   | |    | |
 / ___ \| | | | (_| | |_| | | (_| | |      | |___| |___ | |
/_/   \_\_| |_|\__, |\__,_|_|\__,_|_|       \____|_____|___|
               |___/
@angular/cli: 1.0.0-rc.2
node: 6.10.0
os: linux x64
root@265dcf6e7241:/opt# ng new new-ng2-app --style scss -sg -si
root@265dcf6e7241:/opt# cd new-ng2-app
root@265dcf6e7241:/opt/new-ng2-app# ng set --global packageManager=yarn
```

and then:

```bash
$ cd new-ng-app
$ docker container run --name new-ng2-app -it -v $(pwd):/opt/app -w /opt/app -p 4200:4200 teracy/angular-cli /bin/bash
Starting virtual X frame buffer: Xvfb.
Executing command /bin/bash
root@0273ddf59943:/opt/app# yarn
root@0273ddf59943:/opt/app# ng serve --host=0.0.0.0
```

Tests with Chrome
-----------------

By default Chrome tests did not work within a Docker container, you need to configure karma and
protractor for running tests within the Docker container.

See:

- https://github.com/teracyhq/angular-boilerplate/blob/master/karma.conf.js#L42
- https://github.com/teracyhq/angular-boilerplate/blob/master/protractor.conf.js#L13

`--no-sandbox` option must be used for Chrome to get it running within the Docker container.

and to run unit tests: `$ ng test --browsers Chrome_no_sandbox`, e2e tests: `$ ng e2e`.

You should refer to https://github.com/teracyhq/angular-boilerplate for best practices and working config.


For better developer experience with best practices, please follow this blog post:

http://blog.teracy.com/2017/03/22/how-to-develop-angular-2-applications-easily-with-docker-angular-cli-and-angular-boilerplate/

and use https://github.com/teracyhq/angular-boilerplate


How to develop
--------------


How to contribute
-----------------


LICENSE
-------

MIT license. See the LICENSE file.
