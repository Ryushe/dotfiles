#!/bin/bash

# Check if Tmux is installed
echo "checking if tmux is installed"
sleep 2

if command -v tmux &>/dev/null; then
	echo "Tmux is installed"
else
	echo "Tmux not found\nInstallingtmux now"
	sleep 2
	sudo apt install tmux
fi

# Check if Tpm is already installed
echo "checking if Tpm is installed"
sleep 2
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Tpm is already installed."
else
	# Install Tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Tpm has been installed."
	sleep 2
fi

# Check if gcc is installed
echo "Checking if gcc is installed"

if command -v gcc &>/dev/null; then
	echo "gcc is installed."
	sleep 2
else
	echo "gcc is not installed."
	sleep 2
	sudo apt install -y gcc
fi

# Check if g++ is installed
if command -v g++ &>/dev/null; then
	echo "g++ is installed."
else
	echo "g++ is not installed."
	sleep 2
	echo "installing g++"
	sudo apt install -y g++
fi

# Symbolic links for dot files
filesToCheck=(".bashrc" ".tmux.conf" ".vimrc")

for file in "${filesToCheck[@]}"; do
	filePath="$HOME/$file"
	sourceFile="$PWD/$file"

	if [ -e "$filePath" ]; then
		echo "Found file $file. Removing..."
		rm "$filePath"
		sleep 2

	else
		echo "No file found for $file"
	fi

	echo "Creating a symbolic link for $file"
	ln -s "$sourceFile" "$filePath"
	sleep 2

done

# Check if keychain is installed
if command -v keychain &>/dev/null; then
	echo "keychain is installed."
else
	echo "keychain is not installed."
	sleep 2
	echo "installing keychain"
	sudo apt install -y keychain
fi

# Check if g++ is installed
if command -v oh-my-posh &>/dev/null; then
	echo "ohmyposh is installed."
else
	echo "ohmyposh is not installed."
	sleep 2
	echo "installing ohmyposh"
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# notes:
# oh-my-posh font install
# install jetbrains mono
# make sure shell is in bash not zsh
