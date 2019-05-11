Deploy Application using Docker with Nginx

Install Docker.

$ sudo apt-get install docker.io

Check Docker version.

$ docker -v

Run the docker image ls command on your Docker host.

$ docker image ls

https://github.com/Ameen-Alam/CNC-Docker.git Clone the sample app from GitHub.

$ git clone https://github.com/Ameen-Alam/CNC-Docker.git

The clone operation creates a new directory called CNC-Docker . Change directory into CNC-Docker and list its contents.

$ cd CNC-Docker

static-app or node-app

$ cd static-app

Instruction that is used to build an image. Use the docker image build command to create a new image using the instructions contained in the Dockerfile. This example creates a new Docker image called name:tag. Be sure to perform this command from within the directory containing the app code and Dockerfile.

$ docker build -t static-web:latest .

Check to make sure that the new static-web:latest image exists on your host.

$ docker image ls

You now have a newly built image with the app inside. Run a container from the image and test the app.

$ docker container run -d --name=web1 -p=8080:80 static-web:latest

Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.

http://localhost:8080/

----------------------------------------------------

$ cd node-app

Instruction that is used to build an image. Use the docker image build command to create a new image using the instructions contained in the Dockerfile. This example creates a new Docker image called name:tag. Be sure to perform this command from within the directory containing the app code and Dockerfile.

$ docker build -t node-app:latest .

Check to make sure that the new static-web:latest image exists on your host.

$ docker image ls

You now have a newly built image with the app inside. Run a container from the image and test the app.

$ docker container run -d --name=web2 -p=9000:8080 node-app:latest

Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.

http://localhost:9000/

----------------------------------------------------

If you are working from a freshly installed Docker host it will have no images and will look like the output above. Getting images onto your Docker host is called “pulling”. If you are following along with Linux, pull the ameenalam/static-web:latest.

$ docker image pull ameenalam/static-web:latest

Check to make sure that the new static-web:latest image exists on your host.

$ docker image ls

You now have a newly built image with the app inside. Run a container from the image and test the app.

$ docker container run -d --name=web1 -p=8080:80 static-web:latest

Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.

http://localhost:8080/

----------------------------------------------------

If you are working from a freshly installed Docker host it will have no images and will look like the output above. Getting images onto your Docker host is called “pulling”. If you are following along with Linux, pull the ameenalam/static-web:latest.

$ docker image pull ameenalam/nodeapp:latest

Check to make sure that the new static-web:latest image exists on your host.

$ docker image ls

You now have a newly built image with the app inside. Run a container from the image and test the app.

$ docker container run -d --name=web2 -p=9000:80 ameenalam/nodeapp:latest

Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.

http://localhost:9000/