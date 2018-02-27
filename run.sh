#!/bin/bash
#set -e

function buildDependencies (){
    pushd puppet-base
    docker build . -t puppet-base
    popd
}

function appInstance() {
    local INSTANCE_NAME=$1
    local PORT=$2

    docker rm -f ${INSTANCE_NAME}
    pushd app
    docker build . --rm -t go-app
    popd
    docker run -itd --publish ${PORT}:8080 --rm --name ${INSTANCE_NAME} go-app
}

function loadBalancer() {
    docker rm -f nginx
    pushd web
    docker build . --rm -t nginx
    popd
    docker run -it --publish 32768:80 --name nginx nginx sh  \
     -c "puppet apply /nginx.pp --modulepath=/modules; while true; do sleep 1; done"
}

function clearIntermediateImages() {
    docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
}

function clearAllContainers() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}
#
#function main(){
#    buildDependencies
#    appInstance go-instance1 6060
#    appInstance go-instance2 6061
#    runLoadBalancer
#    clearIntermediateImages
#}
$@
