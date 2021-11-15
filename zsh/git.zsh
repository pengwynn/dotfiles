export GHI_PAGER=less
export GIT_SANDBOX=~/code/sandbox
export GIT_MERGE_AUTOEDIT=no

# Wrap git with hub
alias git=hub

function g {
    if [[ $# > 0 ]]; then
        git "$@"
    else
        echo "Last commit: $(time_since_last_commit) ago"
        git status --short --branch
    fi
}

# Special git alias for my dots (h for home), inspired by:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
function h {
    if [[ $# > 0 ]]; then
        config "$@"
    else
        echo "Last commit: $(time_since_last_commit) ago"
        config status --short --branch
    fi
}


function time_since_last_commit() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    git log -1 --pretty=format:"%ar" | sed 's/\([0-9]*\) \(.\).*/\1\2/'
}

function sandbox() {
    cd $GIT_SANDBOX && git clone $1 && cd `last_modified`
}
