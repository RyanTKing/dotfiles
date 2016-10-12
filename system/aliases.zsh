if $(gls &>/dev/null)
then
    alias ls="gls -F --color"
    alias l="gls -lAh --color"
    alias ll="gls -l --color"
    alias la='gls -A --color'
    alias vim='nvim'
fi

# Classes
alias BUCS="cd $HOME/Projects/Boston-University-CS"
alias CS520="cd $HOME/Projects/Boston-University-CS/CS520\ -\ Principles\ of\ Programming\ Languages"
alias CS655="cd $HOME/Projects/Boston-University-CS/CS655\ -\ Computer\ Networks"
alias CS680="cd $HOME/Projects/Boston-University-CS/CS680\ -\ Introduction\ to\ Computer\ Graphics"
