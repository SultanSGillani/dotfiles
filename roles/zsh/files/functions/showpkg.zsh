
showpkg () {
  apt-cache pkgnames | grep -i "$1" | sort
  return;
}