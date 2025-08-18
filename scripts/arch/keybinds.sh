#!/bin/bash

HYPR_CONF="$HOME/.config/hypr/keybinds.conf"

# extract the keybinding from hyprland.conf
# mapfile -t BINDINGS < <(
#   grep -E '^bind[[:alnum:]]*[[:space:]]*=' "$HYPR_CONF" |
#     sed -e 's/  */ /g' -e 's/bind[^=]*=//g' -e 's/, /,/g' -e 's/ # /,/' |
#     awk -F, -v q="'" '{cmd=""; for(i=3;i<NF;i++) cmd=cmd $(i) " ";print "<b>"$1 " + " $2 "</b>  <i>" $NF ",</i><span color=" q "gray" q ">" cmd "</span>"}'
# )

mapfile -t BINDINGS < <(
  grep -E '^bind[[:alnum:]]*[[:space:]]*=' "$HYPR_CONF" |
    while IFS= read -r line; do
      # separate comment (if any)
      comment=""
      if [[ "$line" =~ (.*)#(.*) ]]; then
        line="${BASH_REMATCH[1]}"
        comment="$(echo "${BASH_REMATCH[2]}" | xargs)" # trim spaces
      fi

      # strip "bind ="
      clean=$(echo "$line" | sed -e 's/  */ /g' -e 's/bind[^=]*=//g' -e 's/, /,/g')

      # split by commas
      IFS=, read -r mod key cmd args <<<"$clean"

      # if no comment, fall back to showing cmd/args
      desc="${comment:-$cmd $args}"

      printf "<b>%s + %s</b>  <i>%s</i><span color='gray'>%s %s</span>\n" \
        "$mod" "$key" "$desc"
    done
)

CHOICE=$(printf '%s\n' "${BINDINGS[@]}" | rofi -dmenu -i -markup-rows -p "Hyprland Keybinds:")

# extract cmd from span <span color='gray'>cmd</span>
CMD=$(echo "$CHOICE" | sed -n 's/.*<span color='\''gray'\''>\(.*\)<\/span>.*/\1/p')

# execute it if first word is exec else use hyprctl dispatch
if [[ $CMD == exec* ]]; then
  eval "$CMD"
else
  hyprctl dispatch "$CMD"
fi
