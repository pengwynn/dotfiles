# export GOROOT="/opt/boxen/homebrew/Cellar/go/1.2"
export GOPATH=$HOME/go
export GOSRC=$GOPATH/src/github.com
export PATH=$PATH:$GOPATH/bin


function gcd {
  cd "$GOSRC/$1"
}
