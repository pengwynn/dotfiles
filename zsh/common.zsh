export GHI_PAGER=less
export EDITOR="mvim -v"

alias cls="clear"
alias lastfm="shell-fm"

function colours() {
for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolour${i}\n"
done
}


function trash() { mv $1 ~/.Trash }
