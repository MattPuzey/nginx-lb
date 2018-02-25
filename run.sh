#!/bin/bash
function buildDependencies (){
    pushd "puppet-base"
    docker build . -t puppet-base
    popd
}

function runAppInstance() {
    local INSTANCE_NAME=$1
}

function runLoadBalancer() {
    docker rm -f nginx
    pushd web
    docker build . --rm -t web
    popd
    docker run -d --publish 32768:80 --name nginx nginx
}


function main(){
    buildDependencies
    runAppInstance 1
    runAppInstance 2
    runLoadBalancer

}
$@
