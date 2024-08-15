cursorpos=$(hyprctl cursorpos)
IFS=', ' read -r x y <<<"$cursorpos"
#only allow main monitor to change wallpapers
pos_allowed=$(hyprctl monitors | grep -Eo '[0-9]{3,}x[0-9]{3,}@[^ ]+ at 0x0' | awk '{print $1}' | sed 's/@.*//')
IFS='x' read -r allowed_x allowed_y <<<"$pos_allowed"

if [ "$x" -lt "$allowed_x" ] && [ "$y" -lt "$allowed_y" ] && [ "$x" -gt 0 ] && [ "$y" -gt 0 ]; then
  echo "Mouse good"
  # Add your commands here
else
  echo "Mouse bad"

fi

echo $x $y
echo $allowed_x $allowed_y
