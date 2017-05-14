alias reload!='. ~/.zshrc'              # Reload zsh config
alias cls='clear'                       # Clear Screeh

# Make sudo work with aliases
alias sudo='sudo '

# Dir Aliases
alias PS="cd $PROJECTS"
alias DS="cd $DOTS"

# Boston University CS Folder Aliases
CS=${PROJECTS}/Boston-University-CS
alias BUCS="cd ${CS}"
for CLASS in ${CS}/*/; do
    alias ${CLASS:t}="cd ${CLASS}"
done
