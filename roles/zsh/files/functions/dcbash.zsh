# Open bash in a container. Pass docker-compose name

dcbash() {
    docker-compose exec "$1" /bin/bash
}
