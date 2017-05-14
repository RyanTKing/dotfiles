# Start an independent Emacs Process in terminal
alias e="emacs -nw"

# Connect to the emacs daemon
alias ec="emacsclient -t -s \"${EMACSD_SOCKET}/server\" -a e"

# Connect to the emacs daemon (visual)
alias ecv="emacsclient -s \"${EMACSD_SOCKET}/server\" -a emacs"
