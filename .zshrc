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

if $(gls &>/dev/null); then
    alias ls="gls -F --color"
    alias l="gls -lAh --color"
    alias ll="gls -l --color"
    alias la='gls -A --color'
fi

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

# Boston University CS folder aliases
CS=${PROJECTS}/Boston-University-CS
alias BUCS="cd ${CS}"
for CLASS in ${CS}/*/; do
    alias ${CLASS:t}="cd ${CLASS}"
done
