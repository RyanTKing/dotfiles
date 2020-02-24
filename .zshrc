# Zsh Config
#

# Load Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh Variables
export DEFAULT_USER=`whoami`
export LSCOLORS="exfxcxdxbxegedabagacad"
# export LS_COLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
# export LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
# export CICOLOR=1

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
zstyle ':completion:*' list-colors 'exfxcxdxbxegedabagacad'
# zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
set -o vi
source ${HOME}/.cargo/env

# General Aliases
alias reload!='. ~/.zshrc' # Reload the zsh config
alias ls="exa -lhB --git"

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

# jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

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

# Set go module vendor
function _goven() {
	if [[ ${1} == "on" ]]; then
		export GOFLAGS="-mod=vendor"
	else
		export GOFLAGS=""
	fi
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
alias goven=_goven
alias gitprune="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"
alias t="go test"
alias tv="go test -v"
alias tc="go test -cover"
alias tvc="go test -v -cover"
alias trc="go test -race -cover"
alias tvrc="go test -v -race -cover"
alias gopls="GOFLAGS=\"-tags=integration\" gopls"

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

