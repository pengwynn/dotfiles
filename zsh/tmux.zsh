function tmxs() {
  SOCKET_PATH=$1
  chmod 777 /tmp/tmux-$SOCKET_PATH
}

function colours() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}


