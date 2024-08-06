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
