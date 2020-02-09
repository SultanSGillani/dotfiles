# Check for outdated dependencies
npmo() {
  if command -v npm-check >/dev/null; then
    npm-check -u -E
  else
    npm outdated
  fi
}
