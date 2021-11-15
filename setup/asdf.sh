#/bin/env bash

set -e
cd "$(dirname "$0")"


if [ -s ~/.asdf ]; then
  echo "asdf installed, skipping..."
else
  git clone https://github.com/asdf-vm/asdf .asdf
fi

echo "Adding plugins"

~/.asdf/bin/asdf plugin-add golang https://github.com/kennyp/asdf-golang
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
~/.asdf/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

echo "DONE!"
