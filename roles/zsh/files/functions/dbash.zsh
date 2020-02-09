# Open bash in a container. Pass container name
dbash() {
    docker exec -it "$1" /bin/bash
}
