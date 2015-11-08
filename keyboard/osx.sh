#/bin/bash

set -e
cd "$(dirname "$0")/keyboard"

mkdir -p ~/Library/Application\ Support/Karabiner

# Prepare custom settings for Karabiner
ln -s $PWD/karabiner/private.xml \
  ~/Library/Application\ Support/Karabiner/private.xml

ln -s $PWD/karabiner/ext \
  ~/Library/Application\ Support/Karabiner/ext
