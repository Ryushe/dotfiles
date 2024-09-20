#!/bin/bash

# NOTE make option to instll flatpak too, y/n while also updating this list with apps that I use a lot

# Check if Tmux is installed
normal_apps=("tmux" "gcc" "kitty" "nvim" "tgpt" "fzf" "zoxide")
flatpak_apps=()

distro=$(lsb_release -is)
if [ "$distro" = "Arch" ]; then
  install_command="pacman -S"
elif [ "$distro" = "Debian" ]; then
  install_command="apt install -y"
fi

# checks apps in normal apps, if not installed install it
for app in "${normal_apps[@]}"; do
  echo checking if $app is installed
  if command -v $app &>/dev/null; then
    echo $app is installed
  else
    echo $app not found, installing now
    sleep 1
    $install_command $app
  fi
done

# Check if Tpm is already installed
echo "checking if Tpm is installed"
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Tpm is already installed."
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "Tpm has been installed."
  sleep 1
fi

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
