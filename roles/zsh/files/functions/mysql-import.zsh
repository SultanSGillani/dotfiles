
function mysql-import (){
  if [ $# -lt 2 ];
  then
    echo 'mysql-import {DB-NAME} {SQL-FILE}';
  else
    mysql $1 < $2;
  fi
}