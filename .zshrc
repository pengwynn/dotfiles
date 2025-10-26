export PATH="/opt/homebrew/opt/sqlite/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

fpath+=$HOME/.zsh/pure

# shortcut to this dotfiles path is $ZSH
export ZSH=~/zsh
export DOTFILES=$HOME

# your project folder that we can `c [tab]` to
export CODE=~/code
export PROJECTS=~/code

# source every .zsh file in this repo
for config_file ($ZSH/**/*.zsh) source $config_file

. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit && compinit

# use .localrc for SUPER SECRET STUFF that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

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

# Tinted Shell
BASE16_SHELL_PATH="$HOME/.config/tinted-theming/tinted-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"


autoload -U promptinit; promptinit
prompt pure


export GH_LOGIN="pengwynn"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_SYNTAX_HIGHLIGHT_PATH="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ] && source $ZSH_SYNTAX_HIGHLIGHT_PATH

archey -o

alias vim="nvim"

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
