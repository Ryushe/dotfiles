#!/bin/bash

# Check if Tmux is installed

distro=$(lsb_release -is)
if [ "$distro" = "Arch" ]; then
	install_command="pacman -S"
elif [ "$distro" = "Ubuntu" ]; then
	install_command="apt install -y"
fi

echo "checking if tmux is installed"
if command -v tmux &>/dev/null; then
	echo "Tmux is installed"
else
	echo "Tmux not found\nInstallingtmux now"
	sleep 1
	sudo apt install tmux
fi

# Check if Tpm is already installed
echo "checking if Tpm is installed"
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "Tpm is already installed."
else
	# Install Tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Tpm has been installed."
	sleep 1
fi

# Check if gcc is installed
echo "Checking if gcc is installed"

if command -v gcc &>/dev/null; then
	echo "gcc is installed."
	sleep 1
else
	echo "gcc is not installed."
	sleep 1
	sudo $install_command gcc
fi


# Check if g++ is installed
if command -v oh-my-posh &>/dev/null; then
	echo "ohmyposh is installed."
else
	echo "ohmyposh is not installed."
	sleep 1
	echo "installing ohmyposh"
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# notes:
# oh-my-posh font install
# install jetbrains mono
# make sure shell is in bash not zsh

# stow moves .files into their respective areas
# for d in `ls .`;
# do
#     ( stow $d ) 
# done
