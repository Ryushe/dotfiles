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
  "playerctl"
  "syncthing"
  "fcitx5"
  "fcitx5-breeze"
  "fcitx5-configtool"
  "fcitx5-gtk"
  "fcitx5-mozc"
  "fcitx5-qt"
  "gammastep"
  "antimicrox"
)
sudo pacman -S "${apps[@]}"

yay_apps=("hyprsome" "hyprtheme")
for app in "${yay_apps[@]}"; do
  yay -S $app
done

echo "if still using ax-shell install it with"
echo "curl -fsSL https://raw.githubusercontent.com/Axenide/Ax-Shell/main/install.sh | bash"
