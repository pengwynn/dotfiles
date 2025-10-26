typeset -U path PATH

path=(
  /opt/homebrew/opt/sqlite/bin
  $HOME/.cargo/bin
  $HOME/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/X11/bin
  $path
)

if [[ -n ${GOPATH:-} ]]; then
  path=("$GOPATH/bin" $path)
fi

export PATH
export HOMEBREW_NO_AUTO_UPDATE=1

setopt extendedglob

fpath+=$HOME/.zsh/pure

# shortcut to this dotfiles path is $ZSH
export ZSH=~/zsh
export DOTFILES=$HOME

# your project folder that we can `c [tab]` to
export CODE=$HOME/code
export PROJECTS=$HOME/code

# source every .zsh file in this repo
for config_file in $ZSH/**/*.zsh; do
  [[ -f "$config_file" ]] && source "$config_file"
done

if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  . "$HOME/.asdf/asdf.sh"
  asdf_completion_dir=${ASDF_DIR:-$HOME/.asdf}/completions
  if [[ -d $asdf_completion_dir ]]; then
    fpath=("$asdf_completion_dir" $fpath)
  fi
fi

# use .localrc for SUPER SECRET STUFF that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

export GH_LOGIN="pengwynn"

alias vim="nvim"

# only run the following in interactive shells
if [[ $- == *i* ]]; then
  # initialize autocomplete here, otherwise functions won't be loaded
  autoload -Uz compinit && compinit -C

  # quote pasted URLs
  autoload -U url-quote-magic
  zle -N self-insert url-quote-magic

  # fun
  autoload -U tetris
  zle -N tetris
  bindkey '^T' tetris

  # Fix history search in tmux
  bindkey '^R' history-incremental-search-backward
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
  bindkey "^P" history-beginning-search-backward
  bindkey "^N" history-beginning-search-forward

  # load every completion after autocomplete loads
  for config_file in $ZSH/**/completion.sh; do
    [[ -f "$config_file" ]] && source "$config_file"
  done

  # Tinted Shell
  BASE16_SHELL_PATH="$HOME/.config/tinted-theming/tinted-shell"
  if [[ -s "$BASE16_SHELL_PATH/profile_helper.sh" ]]; then
    source "$BASE16_SHELL_PATH/profile_helper.sh"
  fi

  autoload -U promptinit; promptinit
  prompt pure

  if [[ -f "$HOME/.fzf.zsh" ]]; then
    source "$HOME/.fzf.zsh"
  fi

  ZSH_SYNTAX_HIGHLIGHT_PATH="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  if [[ -f $ZSH_SYNTAX_HIGHLIGHT_PATH ]]; then
    source "$ZSH_SYNTAX_HIGHLIGHT_PATH"
  fi

  # autosuggestions
  ZSH_AUTOSUGGEST_PATH="$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
  if [[ -f $ZSH_AUTOSUGGEST_PATH ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    source "$ZSH_AUTOSUGGEST_PATH"
  fi

  archey -o
fi
