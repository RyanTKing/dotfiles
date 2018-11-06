#
# Zsh Config
#

# Load Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh Variables
export DEFAULT_USER=`whoami`
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Zsh Options
setopt autolist
setopt cdablevars
setopt autonamedirs
setopt histignoredups
setopt listtypes
setopt nolistbeep
setopt complete_aliases
setopt extendedglob
setopt no_global_rcs

# Aliases
alias sudo='sudo '         # Make sudo work with aliases
alias reload!='. ~/.zshrc' # Reload the zsh config

# Git Aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb'
alias gac='git add -A && git commit -m'

# Docker Aliases
alias dbl='docker-blitz'
alias dcr='docker-compose run'
alias dcb="docker-compose build"
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcdb="docker-compose -f docker-compose.dev.yml build"
alias dcdu='docker-compose -f docker-compose.dev.yml up'
alias dcdd='docker-compose -f docker-compose.dev.yml down'

# Emacs Aliases
alias e="emacs -nw"
alias ec="emacsclient -t -s \"${EMACSD_SOCKET}/server\" -a e"
alias ecv="emacsclient -s \"${EMACSD_SOCKET}/server\" -a emacs"

# Fleet Aliases
# ssh-add ${HOME}/.ssh/fleet_rsa
alias au="export FLEETCTL_ENDPOINT=http://au.cogolo.net"
alias hm="export FLEETCTL_ENDPOINT=http://hmetal.cogolo.net"
alias qm="export FLEETCTL_ENDPOINT=http://qmetal.cogolo.net"

alias querydb="mysql -u rking -h 172.16.17.121 -p"

# Base16 Config
BASE16_SHELL_SET_BACKGROUND=false
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# export WORKON_HOME="$HOME/virtualenv"
# eval "$(pyenv virtualenvwrapper)"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setup ls_extended if available
if [[ ! -z `which ls_extended` ]]; then
    alias ls="ls_extended"
fi

# Kube PS1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# Command for quickly moving around the go path
cogo() {
    CMD=${1}
    ARG=${2}

    if [[ "${CMD}" = "cd" ]]; then
        DEST=`cogopath local ${ARG}`
        if [[ "${DEST}" != "ERROR" ]]; then
            cd "${DEST}"
        fi
        unset DEST
    fi
    if [[ "${CMD}" = "get" ]]; then
        go get -d `cogopath remote ${ARG}`
    fi
}


# added by travis gem
[ -f /Users/rking/.travis/travis.sh ] && source /Users/rking/.travis/travis.sh
