if ! [[ -e ~/builds/autojump ]]; then
  [[ -e ~/builds ]] || mkdir ~/builds
  cd ~/builds

  git clone https://github.com/wting/autojump && cd autojump
  ./install.py
fi
