# Fix incorrect locale on SSH
export LANG=en_AU.UTF-8

# source local variables
sources=(~/dotfiles/local/*.zsh(N))
if (($#sources != 0)); then
  for file in $sources; do
    source "$file"
  done
fi

# source environment variables
sources=(~/profile.d/*.sh(N))
if (($#sources != 0)); then
  for file in $sources; do
    source "$file"
  done
fi

# source zsh settings
sources=(~/dotfiles/zsh/*.zsh(N))
if (($#sources != 0)); then
  for file in $sources; do
    source "$file"
  done
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Better vi mode for zsh
zplug "jeffreytse/zsh-vi-mode"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

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
