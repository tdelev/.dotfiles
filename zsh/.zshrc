# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Detect OS for sourcing OS-specific config below
case "$OSTYPE" in
  darwin*) export DOTFILES_OS=macos ;;
  linux*)  export DOTFILES_OS=linux ;;
  *)       export DOTFILES_OS=unknown ;;
esac

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Common, OS-agnostic PATH entries ($HOME-relative)
export PATH="$HOME/go/bin:$HOME/.local/bin:$PATH"
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

export EDITOR=nvim

# Aliases
source $HOME/.zsh_alias

# Load Angular CLI autocompletion (no-op if `ng` is missing).
if command -v ng >/dev/null 2>&1; then
  source <(ng completion script)
fi

# OS-specific config (PATHs for /opt tools, brew, etc.)
[[ -f "$HOME/.zshrc.$DOTFILES_OS" ]] && source "$HOME/.zshrc.$DOTFILES_OS"

# Go (system install)
export PATH="$PATH:/usr/local/go/bin"

# fzf key bindings and fuzzy completion
# source <(fzf --zsh) # available for version > 0.46.1
[[ -f "$HOME/.completition.zsh" ]] && source "$HOME/.completition.zsh"
[[ -f "$HOME/.key-bindings.zsh" ]] && source "$HOME/.key-bindings.zsh"

# conda initialize
# !! Contents within this block are managed by 'conda init' !!
if [[ -d "$HOME/anaconda3" ]]; then
  __conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
          . "$HOME/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="$HOME/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
fi

# mise
if [[ -x "$HOME/.local/bin/mise" ]]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

# Load private (local, per-machine) settings if present
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
