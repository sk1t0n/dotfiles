# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(aliases git docker docker-compose)
source $ZSH/oh-my-zsh.sh

# Neovim
export EDITOR=nvim
PATH=$PATH:/opt/nvim/bin

# Git
alias gcd="git clone --depth=1 $1"
alias gi="git init"
alias gfi="git flow init"
alias gra="git remote add $1 $2"
alias grv="git remote --verbose"
alias gffs="git flow feature start $1"
alias gffp="git flow feature publish $1"
alias gfft="git flow feature track $1"
alias gfff="git flow feature finish $1"
alias gfbs="git flow bugfix start $1"
alias gfbp="git flow bugfix publish $1"
alias gfbf="git flow bugfix finish $1"
alias gfrs="git flow release start $1 $2"
alias gfrp="git flow release publish $1"
alias gfrf="git flow release finish $1"
alias gfhs="git flow hotfix start $1 $2"
alias gfhf="git flow hotfix finish $1"
alias gs="git status"
alias gS="git show $1"
alias ga="git add $@"
alias gA="git add ."
alias grc="git rm --cached $@"
alias gc="git commit -m $1"
alias gca="git commit --amend"
alias gl="git log --oneline --decorate --graph --all"
alias gwa="git worktree add $1 $2"
alias gwl="git worktree list"
alias gwp="git worktree prune"
alias gch="git checkout $1"
alias gcb="git checkout -b $1 $2"
alias gbd="git branch -d $1"
alias gbD="git branch -D $1"
alias gbl="git branch --list $1"
alias gm="git merge $1"
alias grl="git reset --mixed HEAD~"
alias gta="git tag -a $1 $2"
alias gtd="git tag -d $1"
alias gtl="git tag --list $1"
alias gp="git push origin master"
alias gpt="git push origin --tags"
alias gpd="git push origin --delete $1"
alias gP="git pull origin master"
# Minikube
alias kubectl="minikube kubectl --"
# Tealdeer
alias chelp=tldr
# Exa
alias ls=exa
alias ls2=/usr/bin/ls
alias la="ls -la"
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
# Pastel
alias color=pastel
# wrk
bench () {
  wrk -t2 -c50 -d20s "http://localhost:$1"
}

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
alias gmi="go mod init"
alias gmt="go mod tidy"
alias gmd="go mod download"
alias gg="go get -u"
alias gi="go install"
alias gr="go run"
alias gb="go build"
alias gt="go test"
alias gtc="go tool cover"
alias gtp="go tool pprof"
alias gtt="go tool trace"
alias gd="go doc"
gen_proto_go() {
  protoc --go_out=. --go_opt=paths=source_relative \
         --go-grpc_out=. --go-grpc_opt=paths=source_relative \
         $1
}

# Rust
alias cn="cargo new"
alias ca="cargo add"
alias cr="cargo run"
alias cf="cargo fix"
alias ct="cargo test"
alias cbr="cargo build --release"
alias rd="rustup doc" # for remove dir: rm -rf
alias rdb="rustup doc --book"
alias cdo="cargo doc --open"

#Zig
export PATH=$PATH:$HOME/zig

export PATH=$PATH:$HOME/.local/bin
