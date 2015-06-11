#!/usr/bin/env bash

files=".bashrc .gitconfig .hgrc .muttrc .vimrc $HOME/.xmonad/xmonad.hs"

echo "Creating vim backup directory"
mkdir -p $HOME/.vim/backup

if [[ "$1" = "-y" ]]; then
	yes_to_all=true
fi

for file in $files; do
	dir=$(dirname "$file")
	if [[ $dir = "." ]]; then
		dir=$HOME
	else
		file=$(basename $file)
		mkdir -p $dir	
	fi

	if [[ -z "$yes_to_all" && -f "$dir/$file" ]]; then
		replace=true
		while true; do
			read -p "Do you want to replace the file $file? (y/n/d/q) " ynd
			case $ynd in
				[Yy]* ) rm -f "$dir/$file"; break;;
				[Nn]* ) replace=false; break;;
				[Dd]* ) diff -u "$dir/$file" "$file";;
				[Qq]* ) exit;;
			esac
		done
	else
		replace=true
		rm -f "$dir/$file"
	fi

	if $replace; then
		echo "Linking file $file to $dir/$file"
		ln -s $PWD/$file $dir/$file
	fi
done
