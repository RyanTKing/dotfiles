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

# Fzf
if [[ `uname` == 'Darwin' ]]; then
	source "/usr/local/opt/fzf/shell/key-bindings.zsh"
	source "/usr/local/opt/fzf/shell/completion.zsh"
else
	source "/usr/share/fzf/key-bindings.zsh"
	source "/usr/share/fzf/completion.zsh"
fi

# Startup pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Startup rbenv
eval "$(rbenv init -)"

# Golang setup
# Go anywhere in gopath
function _godir() {
	godirs=( "$HOME/Work" "$HOME/Projects" "$GOPATH/src" )
	for basedir in "${godirs[@]}"; do
		if [ -z $1 ]; then
			pushd "${basedir}"
		else
			if which bfs &> /dev/null; then
				dir=$(bfs -maxdepth 3 -type d -name "${1}*" -f $basedir | head -n 1)
				if [ ! -z $dir ]; then
					pushd $dir
					unset dir
					break
				fi
			else
				pushd $(find "$basedir" -type d -path "${1}*" -print -quit)
			fi
		fi
	done
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

# Function to run pacakge in suite
function _gst() {
	for file in $(find . -type f -name \*_test.go); do
		suite=$(grep -oP '(?<=func ).*(?=\(t)' $file)
		if [ ! -z $suite ]; then
			break
		fi
	done
	if [ -z $suite ]; then
		echo "no test suite found"
		return
	fi

	go test -run $suite . -testify.m $1
}

function _gpgreset() {
	gpgconf --kill gpg-agent
	gpgconf --launch gpg-agent
	&>/dev/null gpg-connect-agent updatestartuptty /bye
}

alias gpgreset=_gpgreset
alias gg=_gg
alias godir=_godir
alias gocover="go test -v -coverprofile=c.out && go tool cover -html=c.out"
alias gst=_gst
alias modon='export GO111MODULE=on'
alias modoff='export GO111MODULE=auto'
alias gitprune="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"

# Kubewctl aliases
[ -f ${HOME}/.kubectl_aliases ] && source ~/.kubectl_aliases

# Cogo specific configs
[ -f ${HOME}/.zshrc_cogo ] && source ${HOME}/.zshrc_cogo

# Travis
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# Setup GPG
export PINENTRY_USER_DATA="USE_CURSES=0"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
&>/dev/null gpg-connect-agent updatestartuptty /bye

# Startup tmux
alias tmux='tmux -u'
if [ -z "$TMUX" ]; then
	tmux
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

