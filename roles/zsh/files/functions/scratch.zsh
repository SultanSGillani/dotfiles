
# credit: http://ku1ik.com/2012/05/04/scratch-dir.html
# Creates a new scratch directory and cds to it
scratch() {
    cur_dir="$HOME/scratch"
    new_dir="$HOME/tmp/scratch-$(date +'%s')"
    mkdir -p "$new_dir"
    ln -nfs "$new_dir" "$cur_dir"
    cd "$cur_dir" || exit 1
    echo "New scratch dir ready for grinding ;>"
}
