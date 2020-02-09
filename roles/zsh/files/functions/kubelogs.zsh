# Usage: kubelogs stage-3 web uwsgi
#        kubelogs stage-3 postgres

kubelogs() {
    namespace=$1
    namere=$2
    name=$(kubectl get pods -n $namespace | grep $namere | head -1 | grep -o '^\S\+')
    if [[ $# -gt 2 ]]; then
        container=$3
        echo 'Tailing logs from the' $container 'container on' $name 'in namespace' $namespace
        kubectl --namespace $namespace logs -f --tail 100 $name -c $container
    else
        echo 'Tailing logs from the default container on' $name 'in namespace' $namespace
        kubectl --namespace $namespace logs -f --tail 100 $name
    fi
}
