# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(aliases git docker docker-compose)
source $ZSH/oh-my-zsh.sh

# Neovim
export EDITOR=nvim
PATH=$PATH:/opt/nvim/bin

# Git
alias gl="git log --oneline"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m $1"
alias gca="git commit --amend"
alias gp="git push -u origin master"
# Minikube
alias kubectl="minikube kubectl --"
# Tealdeer
alias chelp=tldr
# Exa
alias ls=exa
alias ls2=/usr/bin/ls
## Broot
alias tree2=broot
# Bat
alias cat='batcat --paging=never'
alias cat2=/usr/bin/cat
# Fd
alias find2=fd
# Ripgrep
alias grep2=rg
# Dust
alias du=dust
alias du2=/usr/bin/du
# Procs
alias ps=procs
alias ps2=/usr/bin/ps
# Bottom
alias top=btm
alias top2=/usr/bin/top
## Pastel
alias color=pastel
## Hyperfine
alias bench=hyperfine

# Open link in default browser
open() {
  if [ -z "$1" ]; then
    echo "Select one argument from the list:
google (Google)
youtube (YouTube)
translate (Google Translate)
cambridge (Cambridge Dictionary)
vscode (VS Code Marketplace)
github (Github)
docker (Docker Hub)
php (packagist.org)
js (npmjs.com)
go (pkg.go.dev)
rust (crates.io)
python (pypi.org)

For example: open translate 'hello world'"
    return
  fi

  case "$1" in
    http://*|https://*|file:///*|ftp://*|sftp://*) url="$1" ;;
    *) url="https://$1" ;;
  esac

  query=$(echo "$2" | sed -r "s/ /%20/g")

  if [ "$1" = "google" ]; then
    url="https://google.com/search?q=$query"
  elif [ "$1" = "youtube" ]; then
    url="https://youtube.com/results?search_query=$query"
  elif [ "$1" = "translate" ]; then
    url="https://translate.google.com/?sl=en&tl=ru&op=translate&text=$query"
  elif [ "$1" = "cambridge" ]; then
    url="https://dictionary.cambridge.org/dictionary/english-russian/$query"    
  elif [ "$1" = "vscode" ]; then
    url="https://marketplace.visualstudio.com/search?term=$query&target=VSCode&category=All%20categories&sortBy=Relevance"
  elif [ "$1" = "github" ]; then
    url="https://github.com/search?q=$query"
  elif [ "$1" = "docker" ]; then
    url="https://hub.docker.com/search?q=$query"
  elif [ "$1" = "php" ]; then
    url="https://packagist.org/?query=$query"
  elif [ "$1" = "js" ]; then
    url="https://www.npmjs.com/search?q=$query"
  elif [ "$1" = "go" ]; then
    url="https://pkg.go.dev/search?q=$query"
  elif [ "$1" = "rust" ]; then
    url="https://crates.io/search?q=$query"
  elif [ "$1" = "python" ]; then
    url="https://pypi.org/search/?q=$query"
  fi

  xdg-open "$url"
}

# Go
PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

export PATH=$PATH:$HOME/.local/bin
