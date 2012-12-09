if [[ ! -o interactive ]]; then
    return
fi

compctl -K _wynn wynn

_wynn() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(wynn commands)"
  else
    completions="$(wynn completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
