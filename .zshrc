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
		exit 1
	fi

	go test -run $suite . -testify.m $1
}

alias gg=_gg
alias godir=_godir
alias gocover="go test -v -coverprofile=c.out && go tool cover -html=c.out"
alias gst=_gst
alias modon='export GO111MODULE=on'
alias modoff='export GO111MODULE=auto'

# Cogo specific configs
[ -f ${HOME}/.zshrc_cogo ] && source ${HOME}/.zshrc_cogo

# Travis
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# Startup tmux
alias tmux='tmux -u'
if [ -z "$TMUX" ]; then
	export PINENTRY_USER_DATA="USE_CURSES=1"
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
	&>/dev/null gpg-connect-agent updatestartuptty /bye
	tmux
fi


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
