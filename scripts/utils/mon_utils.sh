#!/bin/sh

get_mons() {
  IFS=$'\n' read -r -d '' -a mons < <(hyprctl monitors | grep Monitor | awk '{print $2}' && printf '\0')
  #mons=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
}
list_mons() {
  get_mons
  for i in "${!mons[@]}"; do
    monitor="${mons[$i]}"
    echo $monitor
  done

}
