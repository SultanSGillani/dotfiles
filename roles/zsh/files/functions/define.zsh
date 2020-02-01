
# Dictionary | Usage define <foo>
define() {
    curl -s dict://dict.org/d:$1 | grep -v '^[0-9]'
}