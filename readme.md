# Dotfiles
- ./setup.sh - curently handles installing req libs for my commonly used programs
  - eg: gcc, g++, oh-my-posh, tpm (tmux install plugin)
- ./dotfiles.sh - creates symlinks using stow (really cool)
  - dotfiles has a blacklist to keep important dirs from being touched

## File structure 
Depending on the where the file needs to go:
1. create name (this name doesnt matter)
  -. if needs to go into home put file in the new dir
1. make the new dir of where the file needs to go (eg: .config/nvim ----- actual path /.config/nvim/*)
1. move files into that folder x run ./dotfiles.sh

# How to use 
1. `./removeoldsymlinks.sh`
1. `ln_dotfiles.sh`
1. `install_apps` <- broken currently lol
1. `source-file ~/.tmux.conf` <- from tmux ctrl+mod+:
  - ctrl + r && ctrl + shift + i 
1. `oh-my-posh font install` <- right now kitty using hack

## Hyprland
1. `./install_hyprland_apps.sh`
1. `ln_dotfiles` <- if havent already

## Krohnkite NOTES (tile manager)
- ofc make sure you have run `./ln_dotfiles.sh`
If in vm:
- make sure kde x11 env (can see in SDDM)
- khronkite configure -> behavior -> set to directional
  - if cant see config options:
    - `mkdir -p ~/.local/share/kservices5/`
    - `ln -s ~/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop`

other settings to change:
- change geometry to 10 all (and between tiles)
- make window rule: unimportant, normal window, minimum size (leave default when set)

