#!/bin/bash
function buildDependencies (){
    docker build . -t "puppet-base"
}

function runAppInstance() {
    local INSTANCE_NAME=$1
}

function runLoadBalancer() {
}

function main(){
    buildDependencies
    runAppInstance 1
    runAppInstance 2
    runLoadBalancer

}
$@
