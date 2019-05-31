#!/bin/bash

set -e

function makeLinks() {
  ln -sf ~/Dotfiles/aliases ~/.aliases
  ln -sf ~/Dotfiles/bash_profile ~/.bash_profile
  ln -sf ~/Dotfiles/bash_prompt ~/.bash_prompt
  ln -sf ~/Dotfiles/bashrc ~/.bashrc
  ln -sf ~/Dotfiles/exports ~/.exports
  ln -sf ~/Dotfiles/functions ~/.functions
  ln -sf ~/Dotfiles/inputrc ~/.inputrc
  ln -sf ~/Dotfiles/vimrc ~/.vimrc

# ln -sf ~/Dotfiles/vim/ ~/.vim/
# ln -s ~/Dotfiles/.gitconfig ~/.gitconfig
# ln -s ~/Dotfiles/.gitignore_global ~/.gitignore_global
}

read -rp "Overwrite existing files? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  makeLinks
fi;

cp -Rf ~/Dotfiles/vim ~/.vim

