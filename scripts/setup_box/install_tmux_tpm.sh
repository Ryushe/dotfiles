#!/bin/bash
function show_help() {
  echo "Help menu:"
  echo "    -h || --help shows this menu"
  echo "    -r || --run run the installer"
  echo
  echo "About: this application installs the plugin tpm into .tmux/plugins/tpm"
  echo "Reload tmux env, and then use <prefix>+I to install plugins"
}
case $1 in
-r | --run)
  main
  ;;
*)
  show_help
  exit 1
  ;;
esac

echo "installing tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
