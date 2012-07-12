function mx() {
  if [[ -x $DOTFILES/tmux/layouts/$1 ]]; then
    $DOTFILES/tmux/layouts/$1
  else
    if ! tmux has-session -t $1; then
      tmux new-session -s $1 -n zsh -d
    fi

    tmux attach -t $1
  fi
}
