# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# don't let iterm put anything here
# it should go in environment or something similar
