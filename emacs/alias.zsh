alias e="emacs -nw"
alias ed="emacs --eval \"(setq server-socket-dir \\\"~/.emacs.d/server\\\")\" --daemon"
alias ec="emacsclient -t -s \"$HOME/.emacs.d/server/server\" -a e"
alias ecv="emacsclient -s \"$HOME/.emacs.d/server/server\" -a emacs"
