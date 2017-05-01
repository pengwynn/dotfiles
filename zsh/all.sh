#!/bin/bash

set -e

if [[ $ZSH_NAME != "zsh" ]]; then
  echo "Changing Default Shell to ZSH"
  chsh -s /bin/zsh
fi
