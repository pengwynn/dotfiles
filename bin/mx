#!/usr/bin/env bash

# mx
# version 0.4

# Contributors:
#   Wynn Netherland - http://github.com/pengwynn
#   Adam Jahnke - http://github.com/adamyonk

# Usage:
#   mx [session]

# To 'auto-launch' projects, you'll need a $PROJECTS dir where you keep code
# sorted like so: $PROJECTS/<org or user>/<repo>.
# So, a typical workflow would look like:
#   $ hub clone pengwynn/octonaut $PROJECTS/pengwynn/octonaut
#   $ mx octonaut

# If `mx` is called with a <session> name, and there is no valid repo inside
# $PROJECTS, a new tmux session will be initialized in the current working
# directory with a name of <session>

# If the target directory has a .tmux file, that file will be executed
# (and sent the <session> name as the first argument) instead of the default
# window setup (explained below). An example .tmux file may look like
# so:
#   #!/usr/bin/env sh
#   SESSION="$1"
#   cd ~/.dotfiles
#   tmux new-session -s "$SESSION" -n editor -d
#   tmux send-keys 'e' C-m ':CtrlP' C-m
#   tmux select-window -t "$SESSION":1

# If there is no .tmux file, the default window setup is as follows:
# editor/shell  - runs $EDITOR right away and a new shell in a 50/50 split
# console       - if script/console is available
# server        - if script/server is available

set -e

if [ -z "$1" ]; then
  SESSION="${PWD##*/}"
else
  SESSION="$1"
fi

# tmux 1.9a+ doesn't like .'s in session names
SESSION="${SESSION//./_}"

_safe_window() {
  if [ -x "$2" ]; then
    tmux new-window -n "$1" -t "$SESSION"
    tmux send-keys "$2" C-m
  fi
}

if ! (tmux list-sessions | cut -d':' -f1 | grep -q ^"$SESSION"\$); then
  if [ -d "$PROJECTS"/"$SESSION" ]; then
    cd "$PROJECTS"/"$SESSION"
  fi

  if [ -x "$PWD"/.tmux ]; then
    "$PWD"/.tmux "$SESSION"
  else
    tmux new-session -s "$SESSION" -n editor -d
    tmux send-keys "$EDITOR" C-m #':CtrlP' C-m
    tmux split-window -h
    _safe_window console script/console
    _safe_window server script/server

    tmux select-window -t "$SESSION":1
    tmux select-pane -t0
  fi
fi

if [ -z "$TMUX" ]; then
  tmux attach -t "$SESSION"
else
  tmux switch-client -t "$SESSION"
fi
