alias git='hub'

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

# Pairing
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# hitch


