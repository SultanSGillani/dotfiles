
# SSH and attach tmux session
sst() {
    ssh "$1" -t tmux attach
}
