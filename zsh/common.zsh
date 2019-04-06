export GHI_PAGER=less
export EDITOR="vim"

function colours() {
for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolour${i}\n"
done
}


function trash() { mv $1 ~/.Trash }

# find shorthand
function f() {
    find . -name "$1"
}

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# minimal client for AnyBar status bar app
function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738};  }

# Refresh env vars under tmux
if [ -n "$TMUX"  ]; then
  function refresh {
    export $(tmux show-environment | grep "^SSH_AUTH_SOCK")
  }
else
  function refresh {  }
fi

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}
