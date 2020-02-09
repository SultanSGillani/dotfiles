
#internetinfo | Usage: ii
ii()   # get current host related info
{
    echo -e "\n${RED}Kernel Information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    echo -e "\n${RED}Disk Usage :$NC " ; df -Th
    echo -e "\n${RED}LAN Information :$NC" ; netinfoLAN
    echo
}
