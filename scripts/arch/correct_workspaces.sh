#!/bin/sh
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
declare -A current_orientation
declare -A correct_orientation

option=$1

function show_help() {
  echo "Help menu:"
  echo "  -h | --help to show this menu"
  echo "  -r | --run start the app"
  echo "  -c get current orinetation"
  echo "  -s | --check where the workspaces are"
  echo "  -e compare current to the correct config"
}

function get_current_orientation() {
  while IFS=': ' read -r mon ws; do
      echo "Monitor=$mon, Workspace=$ws"
      current_orientation["$mon"]="$ws"
    done < <(hyprctl monitors -j | jq -r '.[] | "\(.name): \(.activeWorkspace.id)"')
}

function get_correct_orientation() {
ws_list=()
 
  mapfile -t orientation < <(grep -E '^\s*workspace=' "$HOME/.config/hypr/hyprland.conf")
  for line in "${orientation[@]}"; do
    IFS='=, ' read -r _ mon ws <<< "$line"
    correct_orientation["$mon"]="$ws"
    ws_list+=("$ws")
  done
  get_space_gap
  for mon in "${!correct_orientation[@]}"; do
    ws="${correct_orientation[$mon]}"
    echo "Monitor=$mon, Range=$ws-$((ws + space_gap))"
  done
  echo
}

function check_workspace_locations() {
  for mon in ${!current_orientation[@]}; do
    correct_ws="${correct_orientation[$mon]}"
    ws="${current_orientation[$mon]}" # allows ws_range to not be overwritten
    get_range $correct_ws $space_gap # gets an array of the workspace range eg: 11-20 - uses ws
    if ! is_in_array "$ws" "${range[@]}"; then 
      echo "$mon is at $ws which is bad"
      move_workspace
    fi
    echo "$mon is at $ws which is good"
  done
  echo
}

function workspace_good() {
  local mon=$1
  local ws=$2
  local correct_ws="${correct_orientation[$mon]}"
  get_range $correct_ws $space_gap # gets an array of the workspace range eg: 11-20 - uses ws
  if ! is_in_array "$ws" "${range[@]}"; then 
    echo "$mon is at $ws which is bad, correct space: $correct_ws"
    return 1
  fi
  echo "$mon is at $ws which is good"
  return 0
}

function move_workspace() {
  local ws=$1
  local correct_ws=$2
  if (( $ws > $correct_ws )); then
  $script_dir/swap_active_workspaces.sh l
  return
  fi
  $script_dir/swap_active_workspaces.sh r
}

function is_in_array() {
  local val="$1"; shift
  for i; do [[ "$i" -eq "$val" ]] && return 0; done
  return 1
}

function compare_orientations() {
#### this is for visual guide, shows you what monitors have changed between hyprland conf and current
  echo "Diff:"
  get_current_orientation > /tmp/current.txt
  get_correct_orientation > /tmp/correct.txt
  diff --changed-group-format='%<' --unchanged-group-format='' /tmp/current.txt /tmp/correct.txt
  # idea: add maybe sleep then remove txt files
}

function get_range() {
##### gets the diff between two number values $1 $2
  local val="$1"
  local gap="$2"
  range=()
  for ((i = val; i <= val + gap; i++)); do
    range+=("$i")
  done
  echo "range=${range[0]}-${range[-1]}"
}

function get_space_gap() {
##### gets the range between 1st mon and 2nd mon to see what workspaces go where
  if (( ${#ws_list[@]} >= 2 )); then
    space_gap=$(((ws_list[1]-1) - ws_list[0])) # -1 to account for starting with 1 since indexes are off 0 
    echo "Workspace gap: $(( space_gap+1 ))"
  else
    echo "Not enough workspaces to calculate gap"
  fi
}

function main() {
  echo "Current:"
  get_current_orientation
  echo
  echo "Correct:" 
  get_correct_orientation
  echo
  for mon in ${!current_orientation[@]}; do
    local correct_ws="${correct_orientation[$mon]}"
    ws="${current_orientation[$mon]}" # allows ws_range to not be overwritten
    if ! workspace_good $mon $ws; then
    move_workspace $ws $correct_ws
    sleep 1
    get_current_orientation
    fi
  done
}

case $1 in 
  -c)
    get_current_orientation
    ;;
  --run | -r)
    main
    ;;
  -e)
    echo "Current:"
    get_current_orientation
    echo
    echo "Correct:" 
    get_correct_orientation
    echo 
    compare_orientations
    ;;
  --check | -s)
    echo "Current:"
    get_current_orientation
    echo
    echo "Correct:" 
    get_correct_orientation
    check_workspace_locations
    ;;
  *)
    show_help
    ;;
esac
