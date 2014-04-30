cont=$(docker ps | grep sensu-sample | cut -d' ' -f1)
docker kill $cont && docker rm $cont
docker build -t sensu-sample . && docker run -d -p 15672:15672 -p 8080:8080 -p 4567:4567 sensu-sample
