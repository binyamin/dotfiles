#!/bin/bash

# Setup script for a fresh install of xubuntu 20.04

# Do we have sudo access?
if [[ $(id -u) -ne 0 ]];
  echo "Please run this script as root (sudo)"
  exit 1
fi



if $programs[git]; then
  # git
  # Even if already installed, we want the latest version, so .gitconfig works
  # properly
  add-apt-repository ppa:git-core/ppa
  apt install -y git
fi

if $NODEJS; then
  if command -v nvm &> /dev/null; then
    # echo "succeeded"
    echo "NVM already installed, skipping"
  else
    # echo "failed"
    lang_node
    echo "Installed nodejs"
  fi
fi


main () {
  # 1st
  apt upgrade

  apt install -y zsh vim curl yadm plank printer-driver-gutenprint

  # Vim-plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # (must be done in zsh) omz prompt theme
  # git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
  # ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

lang_java () {
  # Off by default
  sudo apt install -y default-jdk default-jre
  echo "Installed java ✔️"
}

lang_py () {
  if $pyenv; then
    apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl
    curl https://pyenv.run | bash
    exec $SHELL
    pyenv install 3.9.2 # version subject to change
  else
    apt install -y python3 python3-pip python3-venv build-essential libssl-dev libffi-dev python3-dev
  fi
  echo "Installed python3 ✔️"
}

lang_node () {
  # Depends: git

  # (via NVM)
  export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

  nvm install lts/*
  npm i -g npm
}

# Install python even if already installed,
# since we have a bunch of other packages
# to install anyways
if $PYTHON3; then
  lang_py
fi

# Off by default
if $JAVA; then
  lang_java
fi

theme () {
  git clone https://github.com/vinceliuice/Qogir-theme.git
  cd ./Qogir-theme
  ./install.sh -l ubuntu
  cd .. && rm -rf ./Qogir-theme

  gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
}

icons () {
  git clone https://github.com/vinceliuice/Qogir-icon-theme.git
  cd Qogir-icon-theme && ./install.sh
  cd .. && rm -rf ./Qogir-icon-theme
}

# UI
if $UI; then
  theme;
  icons;
fi

exit 0
