#!/usr/bin/env bash

files=".bashrc .gitconfig .hgrc .muttrc .vimrc $HOME/.xmonad/xmonad.hs .Xresources"

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

	replace=true
	if [[ -z "$yes_to_all" && -f "$dir/$file" ]]; then
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
		echo "Removing file $dir/$file"
		rm -f "$dir/$file"
	fi

	if "$replace"; then
		echo "Linking file $file to $dir/$file"
		ln -s $PWD/$file $dir/$file
	fi
done

git_vundle="https://github.com/gmarik/Vundle.vim.git"
git_fonts="https://github.com/powerline/fonts.git"

git clone "$git_vundle"
mkdir -p .vim/bundle
cp -R Vundle.vim "$HOME/.vim/bundle"
rm -rf Vundle.vim

git clone "$git_fonts"
mkdir -p "$HOME/.fonts"
cp -R fonts/SourceCodePro "$HOME/.fonts"
rm -rf fonts
fc-cache -fv
