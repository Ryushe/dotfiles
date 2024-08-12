#!/bin/bash

distro=$(lsb_release -is)
if [ "$distro" = "Arch" ]; then
  install_command="pacman -S"
elif [ "$distro" = "Ubuntu" ]; then
  install_command="apt install -y"
fi

blacklist=("ohmyposhthemes" "sddm" "scripts") # add "" no comma for more
for d in $(ls .); do
  if [ -d $d ]; then
    if [[ ! "$(printf "%s\n" "${blacklist[@]}" | grep -Fx "$d")" ]]; then
      if command -v stow &>/dev/null; then
        (stow $d)
        echo linked $d
      else
        $install_command stow
      fi
    fi
  fi
done

# # Symbolic links for dot files
# files=(
#   ".bashrc" ".tmux.conf" ".vimrc"
#   "$HOME/.config/kitty/kitty.conf"
#   "$HOME/.config/kglobalshortcutsrc"
# )

# for file in "${files[@]}"; do
# 	# Extract file name and path if provided
# 	file_name=$(basename "$file")
# 	local_path=$PWD/$file_name
# 	external_path=$file
# 	echo $file_name path $external_path

# 	# allows for custom path conf files
# 	if [ $file_name == $external_path ]; then
# 		external_path="$HOME/$file_name"
# 	fi
# 	if [ -e "$external_path" ]; then
# 		echo "Found file $file. Removing..."
# 		rm "$external_path"
# 		sleep 1

# 	else
# 		echo "No file found for $file"
# 	fi

# 	echo "Creating a symbolic link for $file"
# 	ln -s "$local_path" "$external_path"
# 	sleep 1
# done
