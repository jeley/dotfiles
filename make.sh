#!/bin/bash

# .make.sh
dir="~/dotfiles"             	 # dotfiles directory
olddir="~/.dotfile-discards"       # old dotfiles

# List of files/folders to symlink in homedir
files="aliases bash_profile bash_prompt bashrc exports functions inputrc vim vimrc"

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


