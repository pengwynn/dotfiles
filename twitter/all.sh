#!/bin/sh

if ! [ -x "$(command -v pip)" ]; then
  sudo easy_install pip
fi

sudo pip install rainbowstream

