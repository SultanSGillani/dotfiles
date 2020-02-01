
#rtmp sniffing
sniff-start() {
               sudo iptables -t nat -A OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT ;
}

sniff-capture() {
                         rtmpsrv ;
}

sniff-end() {
             sudo iptables -t nat -D OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT ;
}