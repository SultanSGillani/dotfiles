# Usage: kubepods
#        kubepods stage-3
kubepods() {
    if [ $# -eq 0 ]; then
        kubectl get pods --all-namespaces
    else
        kubectl get pods --all-namespaces | grep $1
    fi
}
