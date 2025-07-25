#!/bin/sh

nerd_config_dir="$HOME/.config/nerd-dictation/"

install_nerd_ai() {
  mkdir -p $nerd_config_dir
  cd $nerd_config_dir
  wget https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip
  unzip vosk-model-small-en-us-0.15.zip
  mv vosk-model-small-en-us-0.15 model

}

check_command() {
  local command=$1
  if command -v $command >/dev/null 2>&1; then
    echo "Command exists"
  else
    echo "Command not found, installing $command"
    yay -S $command --noconfirm
    if [[ $command == "nerd-dictation" ]]; then
      install_nerd_ai
    fi
  fi

}

is_running() {
  local command=$1
  local app=$(ps aux | grep -i "$command" | grep -v "grep")
  if [[ -n "$app" ]]; then
    echo "$command is running"
    return 0
  else
    echo "$command is not running"
    return 1
  fi
}

check_command nerd-dictation
check_command dotool

if is_running "nerd-dictation begin"; then
  echo "ending nerd-dictation"
  nerd-dictation end
else
  echo "starting nerd-dictation"
  nerd-dictation begin --simulate-input-tool=DOTOOL
fi
