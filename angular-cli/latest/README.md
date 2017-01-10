docker-angular-cli
==================

Docker image to work on Angular projects with angular-cli, google-chrome pre-installed


How to use
----------

Make sure you have the latest Docker version installed on your machine.

```bash
$ mkdir new-ng2-app
$ cd new-ng2-app
$ docker run -it -v "$PWD":/usr/src -w /usr/src teracy/angular-cli /bin/bash
Starting virtual X frame buffer: Xvfb.
Executing command /bin/bash
root@4b15ab7dbf21:/usr/src# ng --version
Could not start watchman; falling back to NodeWatcher for file system events.
Visit http://ember-cli.com/user-guide/#watchman for more info.
angular-cli: 1.0.0-beta.15
node: 6.6.0
os: linux x64
root@4b15ab7dbf21:/usr/src# ng init
```

For better developer experience with best practices, please follow this blog post:

http://blog.teracy.com/2016/09/22/how-to-develop-angular-2-applications-easily-with-docker-and-angular-cli/


How to develop
--------------


How to contribute
-----------------


LICENSE
-------

MIT license. See the LICENSE file.
