
# Syntax-highlight text from clipboard
# Requires highlight: brew install highlight
# Usage: hit js
hit() {
    if [ -z "$2" ]
    then src="pbpaste"
    else
        src="cat $2"
    fi
    $src | highlight -O rtf --syntax $1 --font 'Ubuntu Mono' --style solarized-light --font-size 24 | pbcopy
}
