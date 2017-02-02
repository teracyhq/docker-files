#!/bin/bash -e

/etc/init.d/xvfb start && sleep 2

# workaroud, see: https://github.com/karma-runner/karma-chrome-launcher/issues/34
#pkill chrome # kill chrome everytime

echo "Executing command $@"
exec "$@"
