#!/bin/bash


files=(
  ".bashrc" ".tmux.conf" ".vimrc"
  "$HOME/.config/kitty/kitty.conf" 
)

for file in "${files[@]}"; do
	# Extract file name and path if provided
	file_name=$(basename "$file")
	local_path=$PWD/$file_name
	external_path=$file
	echo $file_name path $external_path

	# allows for custom path conf files
	if [ $file_name == $external_path ]; then
		external_path="$HOME/$file_name"
	fi
	if [ -e "$external_path" ]; then
		echo "Found file $file. Removing..."
		rm "$external_path"
		sleep 1

	else
		echo "No file found for $file"
	fi

	echo "Creating a symbolic link for $file"
	ln -s "$local_path" "$external_path"
	sleep 1
done

