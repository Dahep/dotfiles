# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
alias z='zeditor'
alias zed='zeditor'
alias reload='source ~/.bashrc'
alias mine='sudo chown -R $USER:$USER .'
alias ds='docker stop $(docker ps -q)'
alias lzd='lazydocker'
alias lzg='lazygit'

export PATH=$PATH:$HOME/bin

export SSH_AUTH_SOCK=~/.1password/agent.sock
# export SSH_AGENT_SOCK=$SSH_AUTH_SOCK
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="zed"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"
