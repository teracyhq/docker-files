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
