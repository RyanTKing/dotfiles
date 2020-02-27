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
export npm_config_prefix="${HOME}/.node_modules"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion


# FZF Variables
FD_OPTIONS="--follow --hidden --exclude .git"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type 1 $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Setup PATH
PATH="/usr/local/bin:$PATH"
[ -d "/usr/local/sbin" ]				&& PATH="/usr/local/sbin:${PATH}"
[ -d "/usr/bin/core_perl" ] 			&& PATH="/usr/bin/core_perl:${PATH}"
[ -d "/usr/lib/perl5/vendor_perl/bin" ] && PATH="/usr/lib/perl5/vendor_perl/bin:${PATH}"
[ -d "/usr/bin/vendor_perl" ]			&& PATH="/usr/bin/vendor_perl:${PATH}"
[ -d "/usr/lib/perl5/site_perl/bin" ]   && PATH="/usr/lib/perl5/site_perl/bin:${PATH}"
[ -d "/usr/bin/site_perl" ]				&& PATH="/usr/bin/site_perl:${PATH}"
[ -d "/Library/Tex/texbin" ]			&& PATH="/Library/Tex/texbin:${PATH}"
[ -d "/usr/local/MacGPG2/bin" ]			&& PATH="/usr/local/MacGPG2/bin:${PATH}"
[ -d "${HOME}/bin" ]					&& PATH="${HOME}/bin:${PATH}"
[ -d "$GOPATH/bin" ]					&& PATH="$GOPATH/bin:${PATH}"
[ -d "${HOME}/.node_modules/bin" ]		&& PATH="${HOME}/.node_modules/bin:${PATH}"
[ -d "${HOME}/.roswell/bin" ]			&& PATH="${HOME}/.roswell/bin:${PATH}"
[ -d "${HOME}/Projects/fleet_bin" ]		&& PATH="${HOME}/Projects/fleet_bin:${PATH}"

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
