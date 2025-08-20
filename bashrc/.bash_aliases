# Custom functions
add_ssh() {
  path=$1
  eval $(ssh-agent)
  ssh-add -t 5000 $path

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
git_path="~/.ssh/github"
aur_path="~/.ssh/aur"

alias icat="kitten icat"

alias obs="obs --disable-shutdown-check"
#general
alias logout="~/logout.sh"
alias code_dir="cd /mnt/third_wheel/code"
#obsidian vaults
alias work="~/onedrive/obsidian/work"
alias codex="~/onedrive/obsidian/codingXhacking/"
# ssh
alias git_c="add_ssh $git_path"
alias git_aur="add_ssh $aur_path"
alias ssh_r="remove_ssh_identities"
# app opener
alias blog="~/scripts/open_apps/blog/blog.sh"
alias jobbie="~/scripts/open_apps/jobbie/jobbie.sh"
alias ai_images='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/ai_images/ai_images.conf'
alias japaneese='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/japaneese/japaneese.conf'
alias htb='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/htb/htb.conf'
alias jobbie='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/jobbie/jobbie.conf'
alias carter_proj='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/code/carter_proj.conf'
alias bounty='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/bounty/bounty.conf'
alias htb2='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/htb2/htb2.conf'
alias bnty='/home/ryushe/scripts/open_apps/open_apps.sh /home/ryushe/scripts/open_apps/bnty/bnty.conf'
