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

# Emacs Aliases
alias e="emacs -nw"
alias ec="emacsclient -t -s \"${EMACSD_SOCKET}/server\" -a e"
alias ecv="emacsclient -s \"${EMACSD_SOCKET}/server\" -a emacs"

# Base16 Config
# BASE16_SHELL_SET_BACKGROUND=false
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending

eval "$(pyenv init -)"
export WORKON_HOME="$HOME/virtualenv"
eval "$(pyenv virtualenvwrapper)"

# Setup ls_extended if available
if [[ ! -z `which ls_extended` ]]; then
    alias ls="ls_extended"
fi

# Command for quickly moving around the go path
goto () {
    TARGET=${1}

    for PROJ in "${GOPATH}/src/"*/*/*; do
        BNAME=${PROJ##*/}
        if [[ "${BNAME}" = ${TARGET} || "${BNAME}" = "${TARGET}.git" ]]; then
            cd ${PROJ}
        fi
    done
}
