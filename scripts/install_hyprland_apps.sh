pacman_install="pacman -S"
apps=(
  "waybar"
  "grim"
  "hyprpaper"
  "ninja"
  "gcc"
  "wayland-protocols"
  "libjpeg-turbo"
  "libwebp"
  "pango"
  "cairo"
  "pkgconf"
  "cmake"
  "libglvnd"
  "wayland"
  "hyprutils"
  "hyprwayland-scanner"
  "hyprlang"
  "cliphist"
  "wl-clipboard"
  "swappy"
  "dunst"
)
sudo pacman -S "${apps[@]}"

yay_apps=("hyprsome" "flameshot-gui")
for app in "${yay_apps[@]}"; do
  yay -S $app
done
