# Colors in terminal
# ---------------------------------------------------------

export CLICOLOR=true
export LSCOLORS=exFxcxdxbxexexaxaxaxax

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_BLUE="\033[0;34m"
COLOR_BLUE_BOLD="\033[01;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"


# Git in prompt
# ---------------------------------------------------------

function gitInfo {
    local gitStatus="$(git status 2> /dev/null)"
    local onBranch="On branch ([^${IFS}]*)"
    local onCommit="HEAD detached at ([^${IFS}]*)"
    local color=$COLOR_GREEN

    if [[ $gitStatus =~ "working directory clean" ]]; then
        color=$COLOR_RED
    elif [[ $gitStatus =~ "Untracked files" ]]; then
        color=$COLOR_RED
    elif [[ $gitStatus =~ "Changes not staged for commit" ]]; then
        color=$COLOR_RED
    elif [[ $gitStatus =~ "Your branch is ahead of" ]]; then
        color=$COLOR_YELLOW
    elif [[ $gitStatus =~ "Changes to be committed" ]]; then
        color=$COLOR_YELLOW
    fi

    if [[ $gitStatus =~ $onBranch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo -e "$color (branch:$branch)"
    elif [[ $gitStatus =~ $onCommit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo -e "$color (detached:$commit)"
    fi
}

PS1="\u:$COLOR_BLUE_BOLD\w$COLOR_RESET"
PS1+="\$(gitInfo)"
PS1+="$COLOR_RESET \$ "
export PS1


# Bash profile
# ---------------------------------------------------------

alias bp="vim ~/.bash_profile"
alias reload="source ~/.bash_profile"


# Productivity
# ---------------------------------------------------------

alias ~="cd ~"
alias home="~"
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias ls="ls -lhaG"
alias l="ls"
alias dir="ls -alr"
alias du="du -sh"
alias grep="grep --color"
alias rmdir="rm -rf"
alias f="open -a Finder ./"
alias cls="clear"


# Searching
# ---------------------------------------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


# Git aliases
# ---------------------------------------------------------

alias ga="git add"
alias gc="git commit -m"
alias gca="git commit -am"
alias gd="git diff"
alias gs="git status"
alias gpull="git pull"
alias gpush="git push"
alias gco="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gr="git rebase"
alias ghash="git log --format='%H' -n 1"
alias glog='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"'
alias glogd='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"' # git history detailed


# Web development shortcuts
# ---------------------------------------------------------

alias dev="npm run dev"

alias doc="cd ~/www/projects" # document root

alias storm="open -a PhpStorm"
alias code="open -a Visual\ Studio\ Code"
alias chrome="open -a Google\ Chrome"

#alias apacheEdit="sudo edit /etc/httpd/httpd.conf"      # apacheEdit:       Edit httpd.conf
#alias apacheRestart="sudo apachectl graceful"           # apacheRestart:    Restart Apache
alias editHosts="sudo code /etc/hosts"                   # editHosts:        Edit /etc/hosts file
#alias herr="tail /var/log/httpd/error_log"              # herr:             Tails HTTP error logs
#alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:       Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }              # httpHeaders:      Grabs headers from web page

alias dup="docker-compose up ---detach"
alias dupb="docker-compose up --detach --build"
alias ddown="docker-compose down"


# Others
# ---------------------------------------------------------

export PATH="$PATH:~/Development/flutter/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
