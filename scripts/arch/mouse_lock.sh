#!/usr/bin/env bash

state="/tmp/togglemonitorlock"
status="false"
currentWorkspace=$(hyprctl -j activeworkspace | jq '.id')

# id=0
# monitor=$(hyprctl -j monitors | jq -r ".[] | select (.id == $id) | .name")
# defaultPositionCmd="wlr-randr --json | jq \".[] | select (.name == \\\"${monitor}\\\") | .position\" | awk -F': ' '{print \$2}' | tr -d ' ' | tr -d '\n'"
# defaultPosition=$(eval ${defaultPositionCmd})

# Checking the existence of the status file and reading values from it
if [[ -f ${state} ]]; then
  mapfile -t stateValues <${state}
  status="${stateValues[0]}"
fi

# Switching the monitor position and updating the status file
if [[ ${status} == "true" ]]; then
  # echo ${defaultPosition} >${state}
  hyprctl keyword monitor "DP-2,1920x1080@240,0x0,1"
  echo "false" >${state}
else
  # defaultPosition2=$(eval ${defaultPositionCmd})
  # # Save the new monitor position if it has been changed by the user
  # if [[ ${defaultPosition2} == ${defaultPosition} ]]; then
  #   echo ${defaultPosition} >${state}
  # else
  #   echo ${defaultPosition2} >${state}
  # fi
  hyprctl keyword monitor "DP-2,1920x1080@240,2000x2000,1"
  hyprctl dispatch movecursor 2000 2000
  echo "true" >${state}
  sleep 0.3
  # Restoring workspace
  # hyprctl dispatch workspace ${currentWorkspace}
fi
