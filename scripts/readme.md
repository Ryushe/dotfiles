# Scripts
Dotfiles + automation, what could be better?

This place houses all of my scripts that relate to my dotfiles. 

Want more scripts? Check out [here](https://github.com/Ryushe/scripts/)
## Arch
Swap_active_workspaces:
  - bring your 2nd/3rd monitor to you instead of you looking at it
  - enables the ability to move the workspace on another monitor left and right
  - intended use:
    - used with correct_workspaces.sh 
    - used with [hyprsome](https://github.com/sopa0/hyprsome) workspaces
  - how I use it:
    - hyprland keybinds to move workspaces left and right with focus on mouse enabled
    - move monitors where I would like and then when I am done I hit the keybind to trigger correct_workspaces.sh to move everything back
NOTE: if not using correct_workspaces.sh make sure monitors are moved back to default layout before switching workspaces on the monitor 

Correct_workspaces.sh:
  - compares the workspaces to the monitor config within hyprland.conf and if workspaces don't match it moves the monitors back to where they're supposed to be
  - intended use:
    - used with [hyprsome](https://github.com/sopa0/hyprsome) workspaces 
    - used alongside swap_active_workspaces.sh
  - how to use:
  1. Add swap_active_workspaces and correct_workspaces.sh to hyprland.conf as keybinds
    1. move workspaces with swap_active_workspaces.sh 
    - eg `bind = $mainMod, R, exec, $HOME/dotfiles/scripts/arch/correct_workspaces.sh -r`
    - `bind = $mainMod, x, exec, $arch_scripts/swap_active_workspaces.sh l`
    - `bind = $mainMod, c, exec, $arch_scripts/swap_active_workspaces.sh r`
<!-- eventually add the url from ryushe.sh of the uploaded video example -->

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

