
#Sprunge Paste | Usage: sprunge <file>
sprunge() {
  if (($#)); then
if [[ -f $1 && -r $1 ]]; then
curl -F 'sprunge=<-' http://sprunge.us < "$1"
    else
printf 'file %s does not exist or is not readable\n' "$1" >&2
      return 1
    fi
else
curl -F 'sprunge=<-' http://sprunge.us
  fi
}
