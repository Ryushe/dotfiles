!#/bin/bash
pkill polybar
pkill nitrogen
nohup ~/.config/polybar/launch.sh --grayblocks
nohup nitrogen --restore
