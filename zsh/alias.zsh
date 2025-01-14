alias vim="nvim"
alias cat="bat"

alias b="cd .."
alias ls="eza --group-directories-first --color=always --git --icons=always --no-filesize --no-time --no-user --no-permissions"
alias ll="eza --group-directories-first --color=always --git --icons=always --no-filesize --no-time --no-user --no-permissions --long"
alias la="eza --group-directories-first --color=always --git --icons=always --no-filesize --no-time --no-user --no-permissions --long --all"
alias tree="eza --tree --color=always --icons=always"

alias dl="cd $HOME/Downloads && ll"
alias doc="cd $HOME/Documents && ll"
alias proj="cd $HOME/Documents/projects && ll"
alias conf="cd $HOME/.config && ll"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gacm="git add . && git commit -m"
alias gpush="git push"
alias gpull="git pull"
alias gb="git branch"
alias gch="git checkout"
alias gd="git diff"
alias gl="git log"
alias glo="git log --oneline"

alias py="python3"

alias sz="source $HOME/.config/zshrc"
