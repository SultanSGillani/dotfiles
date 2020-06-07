alias 'mkdir'="mkdir -p"
alias 'weather'="'curl -k4 http://wttr.in/Atlanta'"
alias '......'="cd ../../../../.."
alias '.....'="cd ../../../.."
alias '....'="cd ../../.."
alias '...'="cd ../.."
alias '..'="cd .."
alias 'compfuckyou'="compaudit | xargs chmod g-w"
alias 'cputemp'="sensors | grep Core"
alias 'find_big_files'="du -a / | sort -n -r | head -n 10 $1"
alias 'rd'="rmdir"
alias 'suser'="su -"
alias 'vlc'="open -a vlc"
alias 'week'="date +%V"
# Flush Directory Service cache
alias 'flush'="dscacheutil -flushcache"
alias 'pcat'="pygmentize -f terminal256 -O style=native -g"
alias 'grep'="grep --color=auto"
alias 'egrep'="egrep --color=auto"
alias 'fgrep'="fgrep --color=auto"
# remove broken symlinks
alias 'clsym'="find . -xtype l -delete"
# File Size
alias 'filesize'="stat -f \"%z bytes\""
# ROT13-encode text. Works for decoding, too! ;)
alias 'rot13'="tr a-zA-Z n-za-mN-ZA-M"
alias ''="'"
### The Rest ###
alias 'clr'="clear"
alias 'pg'="ps -ef | rg"
alias 'pkill!'="'pkill -9 -f '"
alias 'fkill'="fkill -v"
alias 'lj'="jobs"
alias 'reload!'=". ~/.zshrc"
alias 'timezsh'="time zsh -i -c echo"
alias 'ipe'="curl ipinfo.io/ip"
alias 'play'="ansible-playbook"
