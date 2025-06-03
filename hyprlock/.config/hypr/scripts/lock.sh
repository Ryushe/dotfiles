#!/bin/bash

# Turn off left and right monitors
hyprctl dispatch dpms off DP-3
hyprctl dispatch dpms off HDMI-A-1

# Start hyprlock
hyprlock

# After unlock, turn monitors back on
hyprctl dispatch dpms on DP-3
hyprctl dispatch dpms on HDMI-A-1
