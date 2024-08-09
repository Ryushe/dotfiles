$install_command = "pacman -S"
apps = ("waybar" 
        "flameshot" "grim"
      )
for app in "${apps[@]}"; do 
  install_command $app
done

yay_apps = ("hyprsome")
for app in "${yay_apps[@]}"; do 
  yay -S $app
done
