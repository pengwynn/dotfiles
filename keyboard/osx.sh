#/bin/sh

set -e
cd "$(dirname "$0")/osx-keyboard"

mkdir -p ~/Library/Application\ Support/Karabiner

# Prepare custom settings for Karabiner
ln -sf $PWD/karabiner/private.xml \
  ~/Library/Application\ Support/Karabiner/private.xml

ln -sf $PWD/karabiner/ext \
  ~/Library/Application\ Support/Karabiner/ext
