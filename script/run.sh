# Usage:
# /bin/bash -c "./script/run.sh production"

development() {
    docker-compose -f ./configuration/development.dockerCompose.yml up
}

deployment.buildImage() {
    docker-compose -f ./configuration/development.dockerCompose.yml build --no-cache nodejs
}

production() {
    docker stack deploy -c ./configuration/production.dockerStack.yml animalsoundswebapp
}

if [[ $# -eq 0 ]] ; then # if no arguments supplied, fallback to default
    # List function names:
    # compgen -A function 
    # typeset -f | awk '/ \(\) $/ && !/^main / {print $1}'
    function script.functions () { # https://stackoverflow.com/questions/2630812/get-a-list-of-function-names-in-a-shell-script
        local fncs=`declare -F -p | cut -d " " -f 3`; # Get function list
        echo $fncs; # not quoted here to create shell "argument list" of funcs.
    }
    declare functionList=($(script.functions));
    # declare -rx functionList=($(script.functions));
    printf "• %s " "${functionList[@]}"; echo "\n"
    
    # input command
    echo -n "Enter command: "
    read command
    echo "• Executing: $command. Passing arguments ${@:2}"
    $command
else
    # Important: call arguments verbatim. i.e. allows first argument to call functions inside file. So that it could be called as "./setup/entrypoint.sh <functionName>".
    $@ ${@:2} # execute first command as function and pass it 2nd and all following arguments.
fi
