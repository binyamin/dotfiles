# Setup script for GitHub Codespaces
export INSTALL_ZSH=true
export USERNAME=`whoami`

sudo apt-get update

if [ "$INSTALL_ZSH" = "true" ]
then
  sudo apt-get install -y wget fonts-powerline zsh

  cp -f ~/dotfiles/.zshrc ~/.zshrc
  chsh -s /usr/bin/zsh "$(whoami)"
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

sudo apt-get autoremove -y
