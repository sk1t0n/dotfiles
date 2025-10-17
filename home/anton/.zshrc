export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(aliases git docker docker-compose)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
PATH=$PATH:/opt/nvim/bin

alias gl="git log --oneline"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m $1"
alias gca="git commit --amend"
alias gp="git push -u origin master"
alias kubectl="minikube kubectl --"

PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
