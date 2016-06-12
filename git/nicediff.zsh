# A Better Diff Function
function nicediff {
    diff -W `tput cols` -y "$@" | colordiff | less
}
