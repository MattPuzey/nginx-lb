#!/bin/bash
#set -e

function buildDependencies (){
    pushd puppet-base
    docker build . -t puppet-base
    popd
}

function appInstance() {
    local instance_name=$1
    local port=$2

    docker rm -f ${instance_name}
    pushd app
    docker build . --rm -t go-app
    popd
    docker run -itd --publish ${port}:8080 --rm --name ${instance_name} go-app
}

function checkHostType() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
}

function loadBalancer() {
    docker rm -f nginx
    pushd web
    docker build . --rm -t nginx
    popd

    checkHostType
#    if [ ${machine} -eq "Mac"]; then
#        echo Runing mac ${machine} build of NGINX load balancer

        docker run -it --publish 32768:80 --name nginx nginx sh  \
         -c "puppet apply /nginx.pp --modulepath=/modules; while true; do sleep 1; done"
#    fi
#   for linux hosts:
#    docker run -it --publish 32768:80 --network host --name nginx nginx sh  \
#     -c "puppet apply /nginx.pp --modulepath=/modules; while true; do sleep 1; done"
}

function clearIntermediateImages() {
    docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
}

function clearAllContainers() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}


function fullDemo(){
    buildDependencies
    appInstance go-instance1 6060
    appInstance go-instance2 6061
    loadBalancer
}
$@
