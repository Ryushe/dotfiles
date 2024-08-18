alias codedir="cd /mnt/third_wheel/code"

# Custom functions
connect_to_github() {
  eval $(ssh-agent)
  ssh-add -t 5000 ~/.ssh/github

}

remove_ssh_identities() {
  echo "" # makes sure y flag is seperate in the output
  ssh-add -D
  if [ "$1" == "y" ]; then
    echo "killed all ssh-agent processes"
    pkill ssh-agent
  else
    echo "pass y to remove ssh-agents too"
  fi
}

alias git_c="connect_to_github"
alias ssh_r="remove_ssh_identities"
alias logout="~/logout.sh"
alias htb="~/scripts/open_apps/start_htb.sh"
alias jobbie="~/scripts/open_apps/jobbie.sh"
