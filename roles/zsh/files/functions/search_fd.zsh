#Search files & directories | Usage: search <file/dirs>
search_fd() {
find . -iname "*$@*" | less;
}