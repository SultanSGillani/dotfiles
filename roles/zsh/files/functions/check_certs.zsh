function check_certs () {
  if [ -z "$1" ]
  then
    echo "domain name missing"
    exit 1
  fi
  name="$1"
  shift

  now_epoch=$( date +%s )

  dig +noall +answer $name | while read _ _ _ _ ip;
  do
    echo -n "$ip:"
    expiry_date=$( echo | openssl s_client -showcerts -servername $name -connect $ip:443 2>/dev/null | openssl x509 -inform pem -noout -enddate | cut -d "=" -f 2 )
    echo -n " $expiry_date";
    expiry_epoch=$( date -d "$expiry_date" +%s )
    expiry_days="$(( ($expiry_epoch - $now_epoch) / (3600 * 24) ))"
    echo "    $expiry_days days"
  done
}
