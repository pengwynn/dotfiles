completion="`brew --prefix`"/bash_completion.d/todo_completion

if test -f $completion
then
    source $completion
fi
