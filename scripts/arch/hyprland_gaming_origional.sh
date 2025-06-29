#!/usr/bin/env bash

state="/tmp/togglemonitorlock"
status="false"

# Specify the “ID” of the monitor that is used as the primary monitor, see using hyprctl monitors
id=0

# Monitor ID
monitor=$(hyprctl -j monitors | jq -r ".[] | select (.id == $id) | .name")

# Default position of the monitor
defaultPositionCmd="wlr-randr --json | jq \".[] | select (.name == \\\"${monitor}\\\") | .position\" | awk -F': ' '{print \$2}' | tr -d ' ' | tr -d '\n'"
defaultPosition=$(eval ${defaultPositionCmd})

# Current workspace ID
currentWorkspace=$(hyprctl -j activeworkspace | jq '.id')

# Checking the existence of the status file and reading values from it
if [[ -f ${state} ]]; then
  mapfile -t stateValues <${state}
  defaultPosition="${stateValues[0]}"
  status="${stateValues[1]}"
fi

# Switching the monitor position and updating the status file
if [[ ${status} == "true" ]]; then
  echo ${defaultPosition} >${state}
  wlr-randr --output ${monitor} --pos ${defaultPosition}
  echo "false" >>${state}
else
  defaultPosition2=$(eval ${defaultPositionCmd})
  # Save the new monitor position if it has been changed by the user
  if [[ ${defaultPosition2} == ${defaultPosition} ]]; then
    echo ${defaultPosition} >${state}
  else
    echo ${defaultPosition2} >${state}
  fi
  wlr-randr --output ${monitor} --pos 2000,2000
  echo "true" >>${state}
  sleep 0.3
  # Restoring workspace
  hyprctl dispatch workspace ${currentWorkspace}
fi
