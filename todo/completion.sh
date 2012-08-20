alias td='`brew --prefix`/bin/todo.sh -d $HOME/.todo.cfg'
alias n='td ls +next'
_td() {
  local _todo_sh='`brew --prefix`/bin/todo.sh -d "$HOME/.todo.cfg"'
  _todo "$@"
}

completion="`brew --prefix`"/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion
source $completion

#if test -f $completion
#then
    #source $completion
    #complete -F _td td
#fi
