# aliases for GRC from homebrew
if $(grc &>/dev/null) && $(brew &>/dev/null); then
  source `brew --prefix grc`/etc/grc.bashrc
fi
