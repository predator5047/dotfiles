#!/usr/bin/env bash

files=".bashrc .gitconfig .hgrc .muttrc .vimrc"

echo "Creating vim backup directory"
mkdir -p $HOME/.vim/backup

for file in $files; do
	echo "Copying file $file"
	ln -s $PWD/$file $HOME/$file
done
