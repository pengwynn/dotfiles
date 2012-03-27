# Random sig

function randsig {
  SIGS=($HOME/.dotfiles/sigs/*.txt)
  print ""
  cat $SIGS[$RANDOM%$#SIGS+1]
  print ""
  print ""
}
