files=( ".bashrc" ".vimrc" ".tmux.conf" ".config/kitty/kitty.conf" ".config/kglobalshortcutsrc" ".config/khotkeysrc" )

for file in "${files[@]}"
do 
  rm $HOME/$file
  echo removed $file
done


