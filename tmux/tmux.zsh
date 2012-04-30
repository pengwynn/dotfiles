function mx() {
  if [[ -x $DOTFILES/tmux/layouts/$1 ]]; then
    $DOTFILES/tmux/layouts/$1
  else
    tmux new-session -s $1
  fi
}
