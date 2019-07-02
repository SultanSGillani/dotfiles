
exists() {
  if (( $+commands[$1] )); then return 0; else return 1; fi
}
