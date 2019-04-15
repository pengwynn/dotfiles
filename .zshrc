export PATH="$GOPATH/bin:$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"

# shortcut to this dotfiles path is $ZSH
export ZSH=~/zsh
export DOTFILES=$HOME

# your project folder that we can `c [tab]` to
export CODE=~/code
export PROJECTS=~/code

# source every .zsh file in this repo
for config_file ($ZSH/**/*.zsh) source $config_file

# use .localrc for SUPER SECRET STUFF that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# fun
autoload -U tetris
zle -N tetris
bindkey ^T tetris

# Fix history search in tmux
bindkey '^R' history-incremental-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# load every completion after autocomplete loads
for config_file ($ZSH/**/completion.sh) source $config_file

# asdf
if [ -s "$HOME/.asdf/asdf.sh" ]; then
  source $HOME/.asdf/asdf.sh
fi
if [ -s "$HOME/.asdf/completions/asdf.bash" ]; then
  source $HOME/.asdf/completions/asdf.bash
fi

# awsam
if [ -s "$HOME/.awsam/bash.rc" ]; then
  source $HOME/.awsam/bash.rc
fi

[[ $TMUX != "" ]] && export TERM="tmux-256color"

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

autoload -U promptinit; promptinit
prompt pure


export GH_LOGIN="pengwynn"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_SYNTAX_HIGHLIGHT_PATH="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ] && source $ZSH_SYNTAX_HIGHLIGHT_PATH

archey -o

# Set up default package manager
# eval "$(/Users/wynn/.dpm/bin/dpm init -)"

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

