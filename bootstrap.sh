#!/usr/bin/env bash

files=".bashrc .gitconfig .hgrc .muttrc .vimrc"

for file in $files; do
	echo "Copying file $file"
	ln -s $PWD/$file $HOME/$file
done
