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
if command -v g++ &>/dev/null; then
	echo "g++ is installed."
else
	echo "g++ is not installed."
	sleep 1
	echo "installing g++"
	sudo $install_command g++
fi

# Symbolic links for dot files
files=(
  ".bashrc" ".tmux.conf" ".vimrc"
  "$HOME/.config/kitty/kitty.conf" 
)

for file in "${files[@]}"; do
	# Extract file name and path if provided
	file_name=$(basename "$file")
	local_path=$PWD/$file_name
	external_path=$file
	echo $file_name path $external_path

	# allows for custom path conf files
	if [ $file_name == $external_path ]; then
		external_path="$HOME/$file_name"
	fi
	if [ -e "$external_path" ]; then
		echo "Found file $file. Removing..."
		rm "$external_path"
		sleep 1

	else
		echo "No file found for $file"
	fi

	echo "Creating a symbolic link for $file"
	ln -s "$local_path" "$external_path"
	sleep 1
done

# keychain?
if command -v keychain &>/dev/null; then
	echo "keychain is installed."
else
    echo "keychain is not installed."
    echo "keychain install? (y)es"
    read keychain_inpt
	if [ $keychain_inpt == 'y' ]; then
		sleep 1
		echo "installing keychain"
		sudo $install_command keychain
	fi
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