# Scripts
Dotfiles + automation, what could be better?

This place houses all of my scripts that relate to my dotfiles. 

Want more scripts? Check out [here](https://github.com/Ryushe/scripts/)

## Arch
clear_cache: clears all of arch's cashe

mouse_lock: util to lock mouse for games

toggle_nerd_dictation: enable speech to text

mullvad_change_location: change mullvad location
- usage: `mullvad_change_location.sh seattle`
  - NOTE: can put any location (eg: japan, osaka, germany, etc)

## Hyprpapers
This section handles all of my monitor wallpaper configs

preload_wallpapers.sh:
- Preloads the wallpapers for hyprpapr

set_wallpapers.sh:
- sets the wallpaper corresponding to the input given
- change wallpapers in wallpapers.sh 
- example usage:
```bash
$wp = $wp_dir/set_wallpapers.sh
bind = $mainMod, 1, exec, $wp 1
bind = $mainMod, 2, exec, $wp 2
bind = $mainMod, 3, exec, $wp 3
bind = $mainMod, 4, exec, $wp 4
bind = $mainMod, 5, exec, $wp 5
```
explanation: $wp will point to the script, and 1-5 will select the wallpaper group index in the wallpapers.sh list

wallpapers.sh:
- area to change the wallpapers used (pulls from wallpapers directory at the root of this repo)
- needs 3 wallpaper inputs for now (can have empty strings as input)

## Setup Box 
A bunch of scripts to help automate vm/host deployments

