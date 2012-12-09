_wynn() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(wynn commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(wynn completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _wynn wynn
