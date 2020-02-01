
#Is server up ? | Usage: down4me <www.foo.com>
down4me() {
curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';
}