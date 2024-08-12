pacman_install = "pacman -S"
apps = ("waybar" 
        "flameshot" 
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

      )
for app in "${apps[@]}"; do 
  $pacman_install $app
done

yay_apps = ("hyprsome" )
for app in "${yay_apps[@]}"; do 
  yay -S $app
done
