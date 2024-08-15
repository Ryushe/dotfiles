#!/bin/bash
source ~/dotfiles/scripts/wallpapers.sh

#only allow main monitor to change wallpapers
cursorpos=$(hyprctl cursorpos)
IFS=', ' read -r x y <<<"$cursorpos"
pos_allowed=$(hyprctl monitors | grep -Eo '[0-9]{3,}x[0-9]{3,}@[^ ]+ at 0x0' | awk '{print $1}' | sed 's/@.*//')
IFS='x' read -r allowed_x allowed_y <<<"$pos_allowed"
## if mousepos < res and > 0 allow set
if [ "$x" -lt "$allowed_x" ] && [ "$y" -lt "$allowed_y" ] && [ "$x" -gt 0 ] && [ "$y" -gt 0 ]; then
  echo "Mouse good"
  # Add your commands here
else
  echo "Mouse bad"
  exit 1
fi

# get mons function that gets num of mons and assins them
get_mons() {
  IFS=$'\n' read -r -d '' -a mons < <(hyprctl monitors | grep Monitor | awk '{print $2}' && printf '\0')
  #mons=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
}

#sets mon
set_wp() {
  for i in "${!selected_wps[@]}"; do
    wallpaper="$wp_path${selected_wps[$i]}"
    monitor="${mons[$i]}"
    echo "Wallpaper: $wallpaper, Monitor: $monitor"
    hyprctl hyprpaper wallpaper "$monitor,$wallpaper"
  done
}

if [ $1 ]; then
  if [ ${#selected_wps[@]} -ne ${#mons[@]} ]; then
    echo "Error: Arrays have different lengths."
    exit 1
  fi
  get_mons
  chunk_size=${#mons[@]} # num of mons == num chunk because 1 per mon
  start_index=$((($1 - 1) * chunk_size))
  end_index=$(($start_index + $chunk_size))
  selected_wps=("${wallpapers[@]:$start_index:$end_index}")
  set_wp mons
else
  echo "no input in set_wallpapers"
fi
