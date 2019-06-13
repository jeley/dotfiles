#!/bin/bash

# .make.sh
dir="~/dotfiles"             	 # dotfiles directory
olddir="~/.dotfile-discards"       # old dotfiles

# List of files/folders to symlink in homedir
files="functions bashrc vimrc vim aliases bash_profile bash_prompt inputrc"

mkdir -p "$olddir"
cd "$dir"
echo ''
for file in "$files"; do
    mv "~/.$file" "$olddir"
    echo '==> symlink for "$file"'
    ln -s "$dir/$file" "~/.$file"
echo ''
done

unset file

# for f in ~/dotfiles/*
# do
#     ln -s "$f" "$HOME/.${f##*/}"
# done


