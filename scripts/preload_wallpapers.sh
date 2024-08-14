source ./wallpapers.sh

for wallpaper in "${wallpapers[@]}"; do
  wallpaper=$wp_path$wallpaper
  hyprpaper preload $wallpaper
  echo $wallpaper
done
