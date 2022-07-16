# easily run nvim as sudo
alias sunvim="sudo -E nvim"

# Aliases for ls
if command -v lsd &> /dev/null; then
  alias ls='lsd'
  alias ll='lsd -al --date relative'
  alias la='lsd -A'
  alias l='lsd --tree --depth 2 --color always --icon always | less -R'
  alias lf='fd -H | fzf --preview "bat --style=numbers --color=always --line-range :100 {}"'
fi

# Aliases for FZF
alias cf="cd \$(fd -H --type=d | fzf)"
alias nvimf="nvim \$(lf)"

# Aliases for Arch
if command -v pacman &> /dev/null; then
  alias pacbrowse="pacman -Qeq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
fi

# Alias for having a nice docker log
docker_log() { docker compose logs $1 --follow --tail 20 --no-color --no-log-prefix | ccze -m ansi }

# Alias for quickly bringing up and pulling down docker
docker_go() { 
  docker compose down && docker compose up -d && docker_log $1
}

# Instant aliases
alias ali=". ali"
alias dot=". dot"
alias tmt=". tmt"

# Instant alisases
alias gaa="git add ." 
alias gc="git commit"
alias gpush="git push"
alias gpull="git pull"
alias gs="git status"
alias cpr="rsync -ah --info=progress2"
alias occ="sudo chmod +x /var/www/nc.bea0.xyz/occ && sudo -u www-data /var/www/nc.bea0.xyz/occ"
alias tree="ls --tree"
alias explore="joshuto"
alias ctags="/opt/homebrew/bin/ctags"
alias router_reboot="ssh -oHostKeyAlgorithms=+ssh-rsa admin@192.168.0.2 /sbin/reboot"
alias now="date +"%Y%m%d-%H-%M""
alias nvid="neovide --multigrid"
