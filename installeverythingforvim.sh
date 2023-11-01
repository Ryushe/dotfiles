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
fi

echo "We should do something about the .bashrc"
echo "Moving the .bashrc to the home dir"
sleep 2
mv -f .bashrc ~

echo "Im going to move .tmux.conf now"
sleep 2
mv -f .tmux.conf ~
