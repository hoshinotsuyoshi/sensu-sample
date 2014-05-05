sensu-sample
============

sample docker app

## Development
### At First

```
git submodule init
git submodule update
```

## Dependency


https://github.com/sensu/sensu-community-plugins

* https://index.docker.io/u/hoshinotsuyoshi/sensu-base/

https://github.com/hoshinotsuyoshi/sensu-base-docker


## Deployment

### docker build
docker build -t hogehoge .

### docker run
docker run -d -p 15672:15672 -p 8080:8080 -p 4567:4567 hogehoge

## ssh,etc

see:
https://github.com/petecheslock/sensu-docker/blob/master/README.md
