source ~/dotfiles/scripts/wallpapers.sh

for wallpaper in "${wallpapers[@]}"; do
  wallpaper=$wp_path$wallpaper
  echo $wallpaper
  hyprctl hyprpaper preload $wallpaper
done
