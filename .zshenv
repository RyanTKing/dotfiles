#
# Zsh Environment Variables
#

export TERM="xterm-256color"
export EDITOR="ec"
export VISUAL="ecv"
export ALTERNATE_EDITOR="e"
export DOTS="$HOME/Projects/dotfiles"    # ZSH Configs
export PROJECTS="$HOME/Projects"        # Projects
export PATSHOME="$HOME/ATS/ATS2"
export PATSCONTRIB="$HOME/ATS/ATS2-contrib"
export PATSHOMELOCS=./node_modules:./../../node_modules:./../../../../node_modules
export GOPATH="$HOME/go"
export GOCACHE=off
export NODE_PATH="/usr/lib/node_modules"
export EMACSD_SOCKET="${HOME}/.emacs.d/server"
export CODE_SETTINGS="${HOME}/Library/Application Support/Code/User/settings.json"
export JAVA_HOME=`/usr/libexec/java_home`
export FLEETCTL_ENDPOINT="http://qmetal.cogolo.net"

# Setup PATH
PATH="/usr/local/bin:$PATH"
[ -d "/usr/local/sbin" ]		        && PATH="/usr/local/sbin:${PATH}"
[ -d "/usr/bin/core_perl" ] 		    && PATH="/usr/bin/core_perl:${PATH}"
[ -d "/usr/lib/perl5/vendor_perl/bin" ] && PATH="/usr/lib/perl5/vendor_perl/bin:${PATH}"
[ -d "/usr/bin/vendor_perl" ]		    && PATH="/usr/bin/vendor_perl:${PATH}"
[ -d "/usr/lib/perl5/site_perl/bin" ]   && PATH="/usr/lib/perl5/site_perl/bin:${PATH}"
[ -d "/usr/bin/site_perl" ]		        && PATH="/usr/bin/site_perl:${PATH}"
[ -d "/Library/Tex/texbin" ]            && PATH="/Library/Tex/texbin:${PATH}"
[ -d "${HOME}/bin" ]                    && PATH="${HOME}/bin:${PATH}"
[ -d "$GOPATH/bin" ]                    && PATH="$GOPATH/bin:${PATH}"
# [ -d "$PATSHOME/bin" ]                  && PATH="$PATSHOME/bin:${PATH}"
[ -d "/usr/local/anaconda3/bin" ]       && PATH="/usr/local/anaconda3/bin:${PATH}"
[ -d "${HOME}/.rbenv/bin" ]             && PATH="${HOME}/.rbenv/bin:${PATH}"
[ -d "${HOME}/Projects/fleet_bin" ]     && PATH="${HOME}/Projects/fleet_bin:${PATH}"

# OPAM configuration
. ${HOME}/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Ruby configuration
PATH="$(ruby -e 'print Gem.user_dir')/bin:${PATH}"
export GEM_HOME="${HOME}/.gem"

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
