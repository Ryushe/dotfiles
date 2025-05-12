#!/bin/bash
echo this script only moves the grub theme to its apropriate location
echo this in the future will run my setup scripts
echo little todo list:
echo - ln_dotfiles - want to run before doing grub things
echo - install main apps
echo - move grub and other themes where they belong

###### below is for grub
if [[ $(id -u) != "0" ]]; then
  printf "\n\nError: Current user does not have root perms\n\n"
  exit
fi
echo
grub_themes="/boot/grub/themes"
grub="/etc/default/grub"
echo "WARNING: you are about to move grub theme into $grub_themes"
read -p "Would you like to continue? [y/n]" choice
if [[ $choice -eq "y" ]]; then
  echo linked grub-themes
  ln -s ~/.config/grub-themes $grub_themes
  echo linked grub config
  ln -s ~/.config/grub/grub $grub
else
  exit
fi
###### end of grub
