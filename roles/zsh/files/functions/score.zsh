
#List Realtime Soccer Results | Usage: score
score() {
 watch -n10 --no-title "w3m http://www.livescore.com/ |awk '/live [0-9H]+[^ ]/,/red cards/'" ;
}