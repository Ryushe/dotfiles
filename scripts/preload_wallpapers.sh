# kill itself if running
source ~/dotfiles/scripts/wallpapers.sh

sleep 5
for wallpaper in "${wallpapers[@]}"; do
  wallpaper="$wp_path/$wallpaper"
  echo $wallpaper
  hyprctl hyprpaper preload $wallpaper
done
