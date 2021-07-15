#!/bin/bash

# install all packages
fzf=$(fzf --version)
if [[ $? -ne 0 ]]; then
	echo "fzf not found...installing..."
	sudo apt update && sudo apt install -y fzf
fi

stow=$(stow --version)
if [[ $? -ne 0 ]]; then
	echo "stow not found...installing..."
	sudo apt update && sudo apt install -y stow
fi

# install all dotfiles
for STOW_PACKAGE in $(ls -l | grep '^d' | awk '{print $9}')
do
	echo "setting up ${STOW_PACKAGE}"
	stow $STOW_PACKAGE
done