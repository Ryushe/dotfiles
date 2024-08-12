#!/bin/bash
source ./wallpapers.sh

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
    hyprctl hyprpaper wallpaper "$monitor, $wallpaper"
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
