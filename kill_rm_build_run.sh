docker kill sensu-server && docker rm sensu-server
docker build -t hoshinotsuyoshi/sensu-server . && docker run -d -p 15672:15672 -p 8080:8080 -p 4567:4567 --name sensu-server hoshinotsuyoshi/sensu-server
