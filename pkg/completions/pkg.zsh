if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pkg pkg

_pkg() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(pkg commands)"
  else
    completions="$(pkg completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
