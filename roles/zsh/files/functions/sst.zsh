
# SSH and attach tmux session
function sst() {
    ssh "$1" -t tmux attach
}