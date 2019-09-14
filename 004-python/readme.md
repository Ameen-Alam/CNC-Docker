docker build -t mypyweb .

docker run --name webapp -p 8080:4000 mypyweb

docker run --name webapp -p 8080:4000 -e NAME="Dude" -e BGNAME="blue" mypyweb

#### Share an image
docker login
docker tag mypyweb ameenalam/python-example:1.0
docker push uqutub/python-example:1.0
docker run -p 8080:4000 --name webapp -e NAME="Docker Hub" ameenalam/python-example:1.0
