# Fix incorrect locale on SSH
export LANG=en_AU.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"

# export editor so that it's picked up by all my devices
export EDITOR="nvim"

# start up cargo
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# start up rbenv
if command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

# source custom aliases
source ~/dotfiles/.zsh_aliases

#Oh My ZSH stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
setopt autocd
unsetopt beep extendedglob notify
setopt INC_APPEND_HISTORY

# Which plugins would you like to load?
export ZPLUG_HOME="$HOME/.zplug"
if ! [ -d "$ZPLUG_HOME" ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git",        from:oh-my-zsh
zplug "plugins/rails",      from:oh-my-zsh
zplug "plugins/bg-notify",  from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
