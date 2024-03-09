#!/bin/sh

echo
# install modern shell tolls, ZSH and plugins
sudo nala update; sudo aptitude -t unstable install curl git stow neofetch btop nala bat lsd zoxide fzf inxi \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zsh-theme-powerlevel9k

echo
# Run script to install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
esac

