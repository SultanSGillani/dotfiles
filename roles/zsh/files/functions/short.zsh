
#URL Shortener  | Usage : short <url>
short() {
  curl -F"shorten=$*" https://0x0.st
}