
# fix zsh annoying history behavior
h() {
     if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi;
 }