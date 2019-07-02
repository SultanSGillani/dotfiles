#pb pastebin || Usage: 'command | pb or  pb filename'
pb () {
  curl -F "c=@${1:--}" https://ptpb.pw/
}