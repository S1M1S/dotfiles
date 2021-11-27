if ! command -v autojump &> /dev/null; then
  cd ~
  if ! [[ -e ~/builds ]]; then
    mkdir builds
  fi

  git clone https://github.com/wting/autojump && cd autojump
  ./install.py
  cd ..; rm -rf autojump
fi
