#!/usr/bin/env bash

files=".bashrc .gitconfig .hgrc .muttrc .vimrc $HOME/.xmonad/xmonad.hs"

echo "Creating vim backup directory"
mkdir -p $HOME/.vim/backup

for file in $files; do
	dir=$(dirname "$file")
	if [[ $dir = "." ]]; then
		dir=$HOME
	else
		file=$(basename $file)
		mkdir -p $dir	
	fi

	echo $dir/$file $file
	if [[ -f "$dir/$file" ]]; then
		dont_replace=false
		while true; do
			read -p "Do you want to replace the file $file? (y/n/d) " ynd
			case $ynd in
				[Yy]* ) rm -f "$dir/$file"; break;;
				[Nn]* ) dont_replace=true; break;;
				[Dd]* ) diff -u "$dir/$file" "$file";;
				[Qq]* ) exit;;
			esac
		done
	fi

	if [[ ! "$dont_replace" ]]; then
		echo "Copying file $file"
		ln -s $PWD/$file $dir/$file
	fi
done
