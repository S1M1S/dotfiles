# Add color to common commands
if [[ "$SHELL" == "/bin/bash" ]]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [[ "$SHELL" == "/bin/zsh" ]]; then
  alias ls='ls -G'
fi

# Aliases for sshing
alias starbound='mosh starbound'

# Aliases for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Aliases for FZF
alias fzfcd="cd \$(fzf)"
alias fzfpp="fzf --preview 'bat --style=numbers --color=always --line-range :100 {}'"
alias vimfz="nvim \$(fzfpp)"

#Aliases for Arch
alias pacbrowse="pacman -Qeq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

#Instant aliases
alias gaa="git add ." 
alias gc="git commit"
alias gpush="git push"
alias gpull="git pull"
alias gs="git status"
alias ali=". ali"
alias dot=". dot"
alias tmt=". tmt"
alias vimdiff="nvim -d"
