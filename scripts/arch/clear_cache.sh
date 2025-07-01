#!/bin/bash

selected=$(whiptail --title "Clear Cache Options" --checklist \
  "Select the caches you want to clear:" 20 78 10 \
  "pacman" "Clear pacman cache" OFF \
  "journal" "Clear systemd journal logs" OFF \
  "userCache" "Clear ~/.cache and thumbnails" OFF \
  "tmp" "Clear /tmp and /var/tmp" OFF \
  "memory" "Drop RAM caches" OFF 3>&1 1>&2 2>&3)

[ $? -ne 0 ] && echo "Cancelled." && exit 1

for choice in $selected; do
  case $choice in
  \"pacman\")
    echo "Clearing pacman cache..."
    sudo pacman -Scc --noconfirm
    ;;
  \"journal\")
    echo "Clearing journal logs..."
    sudo journalctl --vacuum-time=1s
    ;;
  \"userCache\")
    echo "Clearing user cache..."
    rm -rf ~/.cache/* ~/.thumbnails/*
    ;;
  \"tmp\")
    echo "Clearing /tmp and /var/tmp..."
    sudo rm -rf /tmp/* /var/tmp/*
    ;;
  \"memory\")
    echo "Dropping RAM caches..."
    sudo sync
    echo 3 | sudo tee /proc/sys/vm/drop_caches
    ;;
  esac
done

echo "Done"
