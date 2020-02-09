
# Tail Files in Directory
  # USAGE: $ log {arg1:file filter(opt)} {arg2:string filter(opt)}
log (){
 if [ $# -lt 1 ];
 then
  tail -f ./*glob*
 fi

 if [ $# -gt 1 ];
 then
  tail -f "$1" | grep --line-buffered "$2"
 else
  tail -f "$1"
 fi
}
