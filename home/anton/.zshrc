source ~/.zsh/antigen.zsh
antigen init ~/.antigenrc

export EDITOR=nvim

alias gl="git log --oneline"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m $1"
alias gca="git commit --amend"
alias gp="git push -u origin master"
alias kubectl="minikube kubectl --"

