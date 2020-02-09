
search (){
    grep -E "$1" . | sort | uniq
}
