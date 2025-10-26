export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:/opt/homebrew/opt/sqlite/bin:/opt/homebrew/opt/openjdk/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.rover/bin:PATH:$HOME/.local/bin"

export HOMEBREW_NO_AUTO_UPDATE=1

# shortcut to this dotfiles path is $ZSH
export ZSH=~/zsh
export DOTFILES=$HOME

# your project folder that we can `c [tab]` to
export CODE=~/code
export PROJECTS=~/code

export HOMEBREW_NO_ENV_HINTS=1

# source every .zsh file in this repo
for config_file ($ZSH/**/*.zsh) source $config_file


# asdf
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

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

# f
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

# awsam
if [ -s "$HOME/.awsam/bash.rc" ]; then
  source $HOME/.awsam/bash.rc
fi

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export BAT_THEME=base16

fpath+=( $HOME/.config/pure )
autoload -U promptinit; promptinit
prompt pure

alias vim="nvim"

export GH_LOGIN="pengwynn"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_SYNTAX_HIGHLIGHT_PATH="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ] && source $ZSH_SYNTAX_HIGHLIGHT_PATH

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fastfetch

# pnpm
export PNPM_HOME="/Users/wnetherland/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
