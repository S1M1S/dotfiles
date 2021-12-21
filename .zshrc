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

#Oh My ZSH stuff
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
setopt autocd
unsetopt beep extendedglob notify
setopt INC_APPEND_HISTORY

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
