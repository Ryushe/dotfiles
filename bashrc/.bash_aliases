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

alias obs="obs --disable-shutdown-check"
#general
alias logout="~/logout.sh"
alias code_dir="cd /mnt/third_wheel/code"
#obsidian vaults
alias work="~/onedrive/obsidian/work"
alias codex="~/onedrive/obsidian/codingXhacking/"
# ssh
alias git_c="connect_to_github"
alias ssh_r="remove_ssh_identities"
# ai
alias bbox="tgpt --provider blackboxai"
alias claude="tgpt --provider duckduckgo --model claude-3-haiku-20240307"
alias llama="tgpt --provider groq --model llama3-70b-8192 --key $GROQ_API_KEY"
alias godmode="godmode >/dev/null 2>&1 &"
## blog
alias blog="~/scripts/open_apps/blog/blog.sh"
# app opener
alias jobbie="~/scripts/open_apps/jobbie/jobbie.sh"
alias ai_images='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/ai_images/ai_images.conf'
alias japaneese='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/japaneese/japaneese.conf'
alias htb='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/htb/htb.conf'
alias jobbie='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/jobbie/jobbie.conf'
alias carter_proj='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/code/carter_proj.conf'
alias bounty='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/bounty/bounty.conf'
alias htb2='~/scripts/open_apps/open_apps.sh ~/scripts/open_apps/htb2/htb2.conf'
alias bnty='/home/ryushe/scripts/open_apps/open_apps.sh /home/ryushe/scripts/open_apps/bnty/bnty.conf'
