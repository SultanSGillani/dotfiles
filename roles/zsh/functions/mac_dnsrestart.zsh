
function dns-restart() {
    sudo launchctl stop homebrew.mxcl.dnsmasq
    sudo launchctl start homebrew.mxcl.dnsmasq
}