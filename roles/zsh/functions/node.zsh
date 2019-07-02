
# Check for outdated dependencies
function npmo() {
  if which npm-check >/dev/null; then
    npm-check -u -E
  else
    npm outdated
  fi
}

# Install latest node version
function nvmi_latest() {
  NOW=$(node -v)
  LATEST=$(nvm ls-remote | tail -1 | grep -E -o '.{0,0}v.{0,6}' | tr -d '\n')

  nvm install "$LATEST" --reinstall-packages-from="$NOW"

  nvm alias default "$LATEST"
  nvm uninstall "$NOW"
}