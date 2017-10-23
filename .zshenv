#
# Zsh Environment Variables
#

export TERM="xterm-256color"
export EDITOR="ec"
export VISUAL="ecv"
export ALTERNATE_EDITOR="e"
export DOTS="$HOME/Projects/dotfiles"    # ZSH Configs
export PROJECTS="$HOME/Projects"        # Projects
export PATSHOME="$HOME/Projects/ATS2"
export PATSCONTRIB="$HOME/Projects/ATS2-contrib"
export PATSHOMELOCS=./node_modules:./../../node_modules:./../../../../node_modules
export GOPATH="$HOME/Go:$PROJECTS/Boston-University-CS/CS562/Project"
export NODE_PATH="/usr/lib/node_modules"
export EMACSD_SOCKET="${HOME}/.emacs.d/server"

# Setup PATH
PATH="/usr/local/bin:$PATH"
[ -d "/usr/local/sbin" ]		            && PATH="/usr/local/sbin:$PATH"
[ -d "/usr/bin/core_perl" ] 		        && PATH="/usr/bin/core_perl:$PATH"
[ -d "/usr/lib/perl5/vendor_perl/bin" ] && PATH="/usr/lib/perl5/vendor_perl/bin:$PATH"
[ -d "/usr/bin/vendor_perl" ]		        && PATH="/usr/bin/vendor_perl:$PATH"
[ -d "/usr/lib/perl5/site_perl/bin" ]   && PATH="/usr/lib/perl5/site_perl/bin:$PATH"
[ -d "/usr/bin/site_perl" ]		          && PATH="/usr/bin/site_perl:$PATH"
[ -d "/Library/Tex/texbin" ]            && PATH="/Library/Tex/texbin:$PATH"
[ -d "${HOME}/bin"]                     && PATH="${HOME}/bin"
[ -d "${HOME}/Projects/dotfiles/bin" ]  && PATH="${HOME}/Projects/dotfiles/bin:${PATH}"
[ -d "$Home/Go/bin" ]                   && PATH="$Home/Go/bin:$PATH"
[ -d "$PATSHOME/bin" ]                  && PATH="$PATSHOME/bin:$PATH"
[ -d "/usr/local/anaconda3/bin" ]       && PATH="/usr/local/anaconda3/bin:$PATH"

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
