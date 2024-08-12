source ./wallpapers.sh

for wallpaper in "${wallpapers[@]}"; do
  wallpaper=$wp_path$wallpaper
  hyprctl hyprpaper preload $wallpaper
  echo $wallpaper
done
