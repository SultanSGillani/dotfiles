
# Escape UTF-8 characters into their 3-byte format
escape() {
    printf "\\\x%s" "$(printf "$@" | xxd -p -c1 -u)"
    echo # newline
}
