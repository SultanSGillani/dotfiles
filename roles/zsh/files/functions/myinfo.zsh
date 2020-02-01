# https://gist.github.com/QinMing/364774610afc0e06cc223b467abe83c0

myinfo () {
    printf "CPU: "
    cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
    printf "\n"

    cat /etc/issue | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
    uname -a | awk '{ printf "Kernel: %s " , $3 }'
    uname -m | awk '{ printf "%s | " , $1 }'
    printf "\n"
    uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
    printf "\n"
    cputemp | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    cputemp | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
}