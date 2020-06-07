alias delete_pycs='fd . -name \"*.pyc\" -exec rm -rf {} \;'
alias pyencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias py=python3
alias icurl="curl -I"
alias pyserv="python -m http.server"
alias autopy="autopep8 --in-place --aggressive $@"