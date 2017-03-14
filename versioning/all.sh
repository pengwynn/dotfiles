#/bin/env bash

set -e
cd "$(dirname "$0")"


if [ -s ~/.asdf ]; then
  echo "asdf installed, skipping..."
else
  git clone https://github.com/asdf-vm/asdf ~/.asdf
fi

echo "Creating symlinks..."

ln -sf $PWD/asdfrc.symlink ~/.asdfrc
ln -sf $PWD/tool-versions.symlink ~/.tool-versions

echo "DONE!"
