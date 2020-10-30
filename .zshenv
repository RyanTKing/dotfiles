#
# Zsh Environment Variables
#

export EDITOR="nvim"
export VISUAL="code"
export ALTERNATE_EDITOR="vim"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export GOBIN="$GOPATH/bin"
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=*.cogolo.net

# FZF Variables
FD_OPTIONS="--follow --hidden --exclude .git"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type 1 $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Setup PATH
GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"
GPGBIN="/usr/local/MacGPG2/bin"
CARGOBIN="${HOME}/.cargo/bin"
YARNBIN="${HOME}/.yarn/bin"
GLOBAL_YARNBIN="${HOME}/.config/yarn/global/node_modules/.bin"
ROSBIN="${HOME}/.roswell/bin"
TEXBIN="/Library/Tex/texbin"
FLEETBIN="${HOME}/Projects/fleet_bin"
PATH="/usr/local/bin:$PATH"
[ -d "/usr/local/sbin" ]				&& PATH="/usr/local/sbin:${PATH}"
[ -d "/usr/bin/core_perl" ] 			&& PATH="/usr/bin/core_perl:${PATH}"
[ -d "/usr/lib/perl5/vendor_perl/bin" ] && PATH="/usr/lib/perl5/vendor_perl/bin:${PATH}"
[ -d "/usr/bin/vendor_perl" ]   		&& PATH="/usr/bin/vendor_perl:${PATH}"
[ -d "/usr/lib/perl5/site_perl/bin" ]  	&& PATH="/usr/lib/perl5/site_perl/bin:${PATH}"
[ -d "/usr/bin/site_perl" ]				&& PATH="/usr/bin/site_perl:${PATH}"
[ -d "${HOME}/bin" ]					&& PATH="${HOME}/bin:${PATH}"
[ -d "${GNUBIN}" ] 						&& PATH="${GNUBIN}:${PATH}"
[ -d "${GPGBIN}" ] 						&& PATH="${GPGBIN}:${PATH}"
[ -d "${GOBIN}" ]						&& PATH="${GOBIN}:${PATH}"
[ -d "${CARGOBIN}" ]					&& PATH="${CARGOBIN}:${PATH}"
[ -d "${YARNBIN}" ]						&& PATH="${YARNBIN}:${PATH}"
[ -d "${GLOBAL_YARNBIN}" ]				&& PATH="${GLOBAL_YARNBIN}:${PATH}"
[ -d "${ROSBIN}" ]						&& PATH="${ROSBIN}:${PATH}"
[ -d "${TEXBIN}" ]						&& PATH="${TEXBIN}:${PATH}"
[ -d "${FLEETBIN}" ]					&& PATH="${FLEETBIN}:${PATH}"

# Clean PATH
typeset -a paths result
paths=($path)

while [[ ${#paths} -gt 0 ]]; do
    p="${paths[1]}"
    shift paths
    [[ -z ${paths[(r)$p]} ]] && result+="$p"
done

export PATH=${(j+:+)result}

setopt no_global_rcs
