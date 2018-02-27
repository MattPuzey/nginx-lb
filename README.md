# NGINX simple load balancer

## Introduction 

This demo is a dockerised demonstration of a simple load balancing scenario whereby a pair of application layer web services are load balanced by and NGINX instance using the round robin method.

## Prerequisites

For MacOS users:
* Docker for Mac v 17.06 or above

For linux distributions (untested):
* A recent Docker installation  

## Run the demo
```
./run.sh fullDemo
```

Browse to [localhost:32768](http://localhost:32768). The NGINX proxy will proxy the request to one of the application servers and the response HTML "Hi there, This is served from `<container_id>`!" is visible in the browser. Refreshing the page will cause the load balancer to send your request to the other application server as per the "round robin" load balancing technique. Since the docker container will report it's host name as it's own container id; it is clear that alternating hosts are serving the inbound request each time we refresh the browser.

## Teardown
Once you're finished with the demo there are some cleanup functions to clear away unwanted images and containers:
```
./run.sh clearIntermediateImages
./run.sh clearAllContainers
```   

