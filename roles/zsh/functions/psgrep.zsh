
#Grep process | Usage: psgrep <process>
psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto;
}