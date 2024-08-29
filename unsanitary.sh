#!/bin/bash

SOURCE=$(dirname "$0")

packages=(
 "devkitpro-pacman"
 "yoga-usage-mode"
 "rpi-kernel-rp4"
 "rpi-kernel-rp4-headers"
)

if [ -z "$SOURCE" ]; then
	echo '=> Fatal error: Could not get the source directory. '
	exit 2
fi

if ! [ -x "$(command -v git)" ]; then
	echo '=> Please install git to continue. '
fi

if [ -d "$SOURCE/void-packages" ]; then
	echo '=> Updating void-packages. '
	pushd "$SOURCE/void-packages" &>/dev/null

	for element in "${packages[@]}"
	do
		echo "=> Clearing $element... "
		rm -R "srcpkgs/$element"
	done

	echo "=> Updating repo "

	git checkout .
	git pull origin master
else
	echo '=> Cloning void-packages... '
	rm void-packages &>/dev/null
	git clone --depth=1 https://github.com/void-linux/void-packages "$SOURCE/void-packages"
fi

popd &>/dev/null

for element in "${packages[@]}"
do
	echo "=> Adding $element... "
	rm -rf "$SOURCE/void-packages/srcpkgs/$element"
	cp -r "$SOURCE/templates/$element" "$SOURCE/void-packages/srcpkgs/"
done

if [ -f "$SOURCE/templates/shlibs" ]; then
	cat "$SOURCE/templates/shlibs" >> "$SOURCE/void-packages/common/shlibs"
fi
