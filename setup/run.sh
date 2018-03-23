development() {
    docker-compose -f ./setup/container/development.dockerCompose.yml up
}

deployment.buildImage() {
    docker-compose -f ./setup/container/development.dockerCompose.yml build --no-cache nodejs
}

production() {
    docker stack deploy -c ./setup/container/production.dockerStack.yml animalsoundswebapp
}

$@