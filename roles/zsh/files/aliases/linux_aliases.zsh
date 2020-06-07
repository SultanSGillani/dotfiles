alias 'apt-update-list-upgrade'="apt update && apt upgrade --dry-run | grep
    Inst | sort | fzf && apt upgrade"
### Copy ###
alias copy='xclip -sel clip < $@ '
alias paste="xclip -selection clip -o"
### Lsb ###
alias 'ubuntu-release'="lsb_release -a"