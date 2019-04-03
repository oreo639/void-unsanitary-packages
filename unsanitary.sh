#!/bin/bash

SOURCE=$(dirname "$0")

packages=("devkitpro-pacman")

if [ -z "$SOURCE" ]; then
	echo '=> Fatal error: Could not get the source directory.'
	exit 2
fi

if ! [ -x "$(command -v git)" ]; then
	echo '=> Please install git to continue. '
fi

if [ -d "$SOURCE/void-packages" ]; then
	echo '=> Updating void-packages. '
	cd "$SOURCE/void-packages"
	rm -R "$SOURCE/void-packages/srcpkgs/*" &>/dev/null
	git checkout .
	git pull origin master
else
	echo '=> Cloning void-packages. '
	rm void-packages &>/dev/null
	git clone https://github.com/void-linux/void-packages "$SOURCE/void-packages"
fi

for element in "${packages[@]}"
do
	echo "Adding $element..."
	cp -r "$SOURCE/templates/$element" "$SOURCE/void-packages/srcpkgs/$element" 
done

