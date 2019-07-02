
pbs () {
  gm import -window ${1:-root} /tmp/$$.png
  pbx /tmp/$$.png
}