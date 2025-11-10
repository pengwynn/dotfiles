export GHI_PAGER=less
export EDITOR="nvim"

function colours() {
for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolour${i}\n"
done
}
