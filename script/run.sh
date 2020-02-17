development() {
    docker-compose -f ./configuration/development.dockerCompose.yml up
}

deployment.buildImage() {
    docker-compose -f ./configuration/development.dockerCompose.yml build --no-cache nodejs
}

production() {
    docker stack deploy -c ./configuration/production.dockerStack.yml animalsoundswebapp
}

$@