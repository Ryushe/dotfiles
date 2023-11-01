#!/bin/bash


# Check if Tmux is installed
echo "checking if tmux is installed"
sleep 2

if  command -v tmux &> /dev/null; then
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


# Check if ~/.config/nvim exists
echo "checking if ~/.config/nvim exists is installed"
sleep 2
nvim_dir=~/.config/nvim
if [ ! -d "$nvim_dir" ]; then
    echo "Directory $nvim_dir does not exist. Creating it..."
    mkdir -p "$nvim_dir"
else
    echo "Directory $nvim_dir already exists."
fi
# put the path for init.vim into default loacation (it will overwrite it)
echo 'luafile $NVIM_INIT_VIM' > ~/.config/nvim/init.vim

# check if packer exists
if [-d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"]; then
    echo "packer for nvim already installed"
else
    # install packer
    echo "Installing packer for Nvim"
    sleep 2
    git clone --depth 1 "https://github.com/wbthomason/packer.nvim" "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    echo "packer is now installed"
fi
