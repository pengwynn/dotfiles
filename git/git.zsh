export GHI_PAGER=less
export GIT_SANDBOX=~/Projects/sandbox
export GIT_MERGE_AUTOEDIT=no

# Wrap git with hub
if [[ -f `command -v hub` ]] ; then alias git=hub ; fi

alias g='git'

# Git flow
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
alias gfr='git flow release'
alias gfrs='git flow release start'
alias gfrf='git flow release finish'
alias gfh='git flow hotfix'
alias gfhs='git flow hotfix start'
alias gfhf='git flow hotfix finish'
alias gfs='git flow support'
alias gfss='git flow support start'

alias gst='git status -sb'

# Pairing
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# hitch

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

function sandbox() {
  cd $GIT_SANDBOX && git clone $1 && cd `last_modified`
}
