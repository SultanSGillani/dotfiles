
#encrypt <file> | Usage encrypt <file>
function encrypt() {
        [ -e "$1" ] || return 1
        openssl des3 -salt -in "$1" -out "$1.$CRYPT_EXT"
        [ -e "$1.$CRYPT_EXT" ] && shred -u "$1"
}

#decrypt <file.> | Usage decrypt <file.>
function decrypt() {
        [ -e "$1" ] || return 1
        [ "${1%.$CRYPT_EXT}" != "$1" ] || return 2
        openssl des3 -d -salt -in $1 -out ${1%.$CRYPT_EXT}
        [ -e "${1%.$CRYPT_EXT}" ] && rm -f "$1"
}