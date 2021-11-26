export ZPLUG_HOME="$HOME/.zplug"
if ! [ -d "$ZPLUG_HOME" ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

zplug "plugins/git",        from:oh-my-zsh
zplug "plugins/rails",      from:oh-my-zsh
zplug "plugins/bg-notify",  from:oh-my-zsh

zplug "arzzen/calc.plugin.zsh", from:github
zplug "wting/autojump",         from:github
zplug "zpm-zsh/colorize",       from:github

# Better vi mode for zsh
zplug "jeffreytse/zsh-vi-mode"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

if ! [ $TERM = "linux" ]; then
  zplug "zsh-users/zsh-autosuggestions"
  zplug "mafredri/zsh-async", from:github
  zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install Zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load
