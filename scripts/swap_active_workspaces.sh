#!/bin/bash
source ~/dotfiles/scripts/get_mons.sh

current_mon_id=$(hyprctl activewindow | grep -oP '(?<=monitor: )\d+')
current_mon_name=$(hyprctl monitors | grep -A 1 "ID $current_mon_id" | grep "Monitor" | awk '{print $2}')

declare -A monitor_moves
#left  right movements
monitor_moves["$left_mon"]="$right_mon $main_mon"
monitor_moves["$main_mon"]="$left_mon $right_mon"
monitor_moves["$right_mon"]="$main_mon $left_mon"

possible_moves=${monitor_moves[$current_mon_name]}

if [[ $1 = "l" ]]; then
  new_mon=$(echo "$possible_moves" | awk '{print $1}')
elif [[ $1 = "r" ]]; then
  new_mon=$(echo "$possible_moves" | awk '{print $2}')
else
  echo "cant move monitor to nowhere... please give 'r' or 'l'"
fi
hyprctl dispatch swapactiveworkspaces $current_mon_name $new_mon
echo moving $current_mon_name to $new_mon
