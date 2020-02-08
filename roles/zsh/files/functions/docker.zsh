# Open bash in a container. Pass docker-compose name

function dcbash {
    docker-compose exec "$1" /bin/bash
}

# Open bash in a container. Pass container name
function dbash {
    docker exec -it "$1" /bin/bash
}
