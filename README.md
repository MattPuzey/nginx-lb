Build the base: 
```
 docker build . -t "puppet-base"
```

Build and run nginx:
```
docker build -t "nginx" .
docker run -Pdt nginx

```
Find nginx port: 
```
docker port <docker_containter_id> 80

```

Build the app:
```
docker build -t go-app .
```

Run the app:
```
docker run -itd --publish 6060:8080 --rm --name go-app go-app
```

