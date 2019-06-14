#!/bin/bash

set -e

function makeLinks() {
  ln -sf ~/dotfiles/aliases ~/.aliases
  ln -sf ~/dotfiles/bash_profile ~/.bash_profile
  ln -sf ~/dotfiles/bash_prompt ~/.bash_prompt
  ln -sf ~/dotfiles/bashrc ~/.bashrc
  ln -sf ~/dotfiles/exports ~/.exports
  ln -sf ~/dotfiles/functions ~/.functions
  ln -sf ~/dotfiles/inputrc ~/.inputrc
  ln -sf ~/dotfiles/vimrc ~/.vimrc
#  ln -sf ~/dotfiles/gitconfig ~/.gitconfig
#  ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
}

read -rp "Overwrite existing files? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  makeLinks
fi;

# rm -r .vim

cp -Rf ~/dotfiles/vim ~/.vim


