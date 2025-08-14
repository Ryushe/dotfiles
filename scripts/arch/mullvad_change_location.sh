#!/usr/bin/env bash

# Available options for TUI
locations=("Japan" "Seattle")

# Function to get relay
get_relay() {
  local location="$1"
  mullvad relay list | grep -i "$location" -A8 | grep -E 'wg-[0-9]{3}' | awk '{print $1}' | shuf -n 1
}

# Disconnect first
disconnect_vpn() {
  mullvad disconnect
}

# Connect to given relay
connect_vpn() {
  local relay="$1"
  echo "Connecting to $relay..."
  mullvad relay set location "$relay"
  mullvad connect
}

# If arguments are given (non-TUI mode)
if [ $# -gt 0 ]; then
  for loc in "$@"; do
    relay=$(get_relay "$loc")
    if [ -n "$relay" ]; then
      disconnect_vpn
      connect_vpn "$relay"
      exit 0
    else
      echo "No relay found for $loc"
    fi
  done
else
  # No args, launch TUI with fzf
  selected=$(printf "%s\n" "${locations[@]}" | fzf --multi --prompt="Select locations: " --bind 'space:toggle-preview')
  if [ -z "$selected" ]; then
    echo "No selection made. Exiting."
    exit 1
  fi

  for loc in $selected; do
    relay=$(get_relay "$loc")
    if [ -n "$relay" ]; then
      disconnect_vpn
      connect_vpn "$relay"
      exit 0
    else
      echo "No relay found for $loc"
    fi
  done
fi
