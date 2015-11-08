#!/usr/bin/env bash

set -e

# find generic installers and run them interactively
echo "Running generic installers"
find . -name all.sh | while read installer ; do sh -c "${installer}" > /dev/null ; done
