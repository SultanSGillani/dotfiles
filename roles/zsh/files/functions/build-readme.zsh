
build-readme() {
    if [[ -e README.html ]]; then
        rm README.html
    fi
    rst2html.py README.rst > README.html
    open README.html
}
