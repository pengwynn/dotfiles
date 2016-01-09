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
