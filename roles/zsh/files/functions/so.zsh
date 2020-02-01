
# StackOverflow bash search function  | Usage: so <foo>
so() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    w3m "http://stackoverflow.com/search?q=$search"
}