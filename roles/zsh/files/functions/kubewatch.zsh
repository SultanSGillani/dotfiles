# Usage: kubewatch
#        kubewatch stage-3
kubewatch() {
    if [ $# -eq 0 ]; then
        watch -n 1 "kubectl get pods --all-namespaces"
    else
        watch -n 1 "kubectl get pods --all-namespaces | grep $1"
    fi
}
