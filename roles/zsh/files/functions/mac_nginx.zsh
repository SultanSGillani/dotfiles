
function ng-stop() {
    sudo launchctl stop homebrew.mxcl.nginx
}

function ng-start() {
    sudo launchctl start homebrew.mxcl.nginx
}
function ng-restart() {
    sudo launchctl start homebrew.mxcl.nginx
}