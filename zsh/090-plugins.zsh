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
