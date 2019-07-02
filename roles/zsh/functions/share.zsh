
#Upload-file | Usage : share /path/to/file.foo
share() {
  curl -F"file=@$*" https://0x0.st
}