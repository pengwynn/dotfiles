_td() {
  local _todo_sh='`brew --prefix`/bin/todo.sh -d "$HOME/.todo.cfg"'
  _todo "$@"
}

completion="`brew --prefix`"/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion
source $completion

compdef td=todo.sh
