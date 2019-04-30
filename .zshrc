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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
set -o vi

# General Aliases
alias reload!='. ~/.zshrc' # Reload the zsh config
if which ls_extended > /dev/null; then alias ls=ls_extended; fi

if [[ `uname` == 'Linux' ]]; then
	alias open='xdg-open'
fi

if [[ `uname` == 'Darwin' ]]; then
	alias copy='pbcopy'
else
	alias copy='xclip -selection clipboard'
fi

# Startup pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Startup rbenv
eval "$(rbenv init -)"

# Golang setup
# Go anywhere in gopath
function _godir() {
	basedir="$GOPATH/src"
	if [ -z $1 ]; then
		pushd "${basedir}"
	else
		if which bfs &> /dev/null; then
			pushd $(bfs -type d -name "*${1}*" -f "$GOPATH/src" | head -n 1)
		else
			pushd $(find "$GOPATH/src" -type d -path "*${1}*" -print -quit)
		fi
	fi
}

# Function to `go get` from URLs copied from browser
function _gg() {
    args=' -v -u '
    imports=($@)
    for i in "${imports[@]}"; do
        if [[ "$i" == -* ]]; then
            args+="$i "
            continue
        fi
        i=${i#http*://}
        i=${i#git*://}
        go get $args $i
    done
}

alias gg=_gg
alias godir=_godir
alias gocover="go test -v -coverprofile=c.out && go tool cover -html=c.out"

# Ensure gpg is running
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

# Cogo specific configs
[ -f ${HOME}/.zshrc_cogo ] && source ${HOME}/.zshrc_cogo

# Travis
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# Startup tmux
alias tmux='tmux -u'
if [ -z "$TMUX" ]; then
	tmux
fi


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
