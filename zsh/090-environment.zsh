# easily locate the dotfiles folder
export DOTFILES="$HOME/dotfiles"
export DF_CONFIG="$DOTFILES/.config"
export DF_LOCAL="$DOTFILES/local"

export XDG_CONFIG_HOME="$HOME/.config"

# source zplug plugins and add commands to $PATH
zplug load

# set up paths
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

# export editor so that it's picked up by all my devices
export EDITOR="nvim"

# export variables to help with sourcing and refreshing
export ZSHRC="$DOTFILES/.zshrc"
export ZSHRC_CONFIG="$DOTFILES/zsh"
export ZSHRC_CONFIG_ALIASES="$ZSH_CONFIG/aliases.zsh"

# source iterm shell integration if we're using iterm2
if [ "$TERM" = "xterm-256color" ]; then
  test -e "$DF_CONFIG/.iterm2/iterm2.zsh" && source "$DF_CONFIG/.iterm2/iterm2.zsh"
fi

# start up cargo
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# start up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

# start up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
