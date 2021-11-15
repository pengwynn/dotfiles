export GOPATH=$HOME/go
export GOSRC=$GOPATH/src/github.com
export PATH=$PATH:$GOPATH/bin


function gcd {
  cd "$GOSRC/$1"
}
