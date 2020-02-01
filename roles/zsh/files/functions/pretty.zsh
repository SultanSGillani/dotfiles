
pretty() {
    pygmentize -f terminal256 $* | less -R
}