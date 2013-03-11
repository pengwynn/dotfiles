# aliases for GRC from homebrew
if (( $+commands[grc] )) && (( $+commands[brew] )); then
  source `brew --prefix grc`/etc/grc.bashrc
fi
