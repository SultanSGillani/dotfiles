
function search (){
    egrep -roiI $1 . | sort | uniq
}

#Search files & directories | Usage: search <file/dirs>
search_fd() {
find . -iname "*$@*" | less;
}