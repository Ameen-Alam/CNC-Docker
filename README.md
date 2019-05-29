# Install Docker with Linux

*There are two ways of installing it. The official docker way is a bit more recent.*

##### 1st way..

### A) Official Ubuntu Repositories

`$ sudo apt-get install docker.io`

> and after verify the installation

`$ docker -v`

`$ sudo docker run hello-world`

------------------------

##### 2nd way

### (B) Official Docker Way

**(1) Set up the docker repository and Install Docker CE**

> Updating the apt package index

`$ sudo apt-get update`

> Installing packages to allow apt to use a repository over HTTPS:

`$ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common`

> Adding Docker’s official key GPG

`$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

> Verifying that you now have the key with fingerprint:

`$ sudo apt-key fingerprint 0EBFCD88`

> sub-command below returns the name of your Ubuntu distribution

`$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`

> Updating the apt package index

`$ sudo apt-get update`

> Installing the latest version of Docker CE and containerd

`$ sudo apt-get -y install docker-ce docker-ce-cli containerd.io`

> and after verify the installation

`$ docker -v`

`$ sudo docker run hello-world`

###### Thankyou.

--------------------

# Deploy Application using Docker with Nginx

> https://github.com/Ameen-Alam/CNC-Docker.git Clone the sample app from GitHub.

`$ git clone https://github.com/Ameen-Alam/CNC-Docker.git`

**The clone operation creates a new directory called CNC-Docker . Change directory into CNC-Docker and list its contents.**

`$ cd CNC-Docker`

> static-app or node-app

`$ cd static-app`

__two way to run a container__
<ul>
 <li>The Ops perspective</li>
 <li>The Dev perspective</li>
</ul>

--------------------------------

### Start The Dev Perspective

*Instruction that is used to build an image. Use the docker image build command to create a new image using the instructions contained in the Dockerfile. This example creates a new Docker image called name:tag. Be sure to perform this command from within the directory containing the app code and Dockerfile.*

#### Build Image

> <pre><code>docker build -t <image_name>:<tag> .</code></pre>

  `
$ docker build -t static-web:latest .
`

#### docker images list

  `$ docker image ls`

#### Run Container

> docker run --name <container_name> -p <host_port>:<container_port> <image_name>:<tag>

  `$ docker container run -d --name=web1 -p=8080:80 static-web:latest`

#### For Test

  ` $ curl http://localhost:8080`

*Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.*

> http://localhost:8080

----------------------------------------------------

### Start The Ops Perspective

*If you are working from a freshly installed Docker host it will have no images and will look like the output above.
Getting images onto your Docker host is called “pulling”. If you are following along with Linux, pull the ameenalam/nodeapp:latest.*

#### To pull an image

> docker pull <image_name>:<tag>

`$ docker image pull ameenalam/nodeapp:latest`

#### docker images list

  `$ docker image ls`

#### Run Container

> docker run --name <container_name> -p <host_port>:<container_port> <image_name>:<tag>

  `$ docker container run -d --name=web2 -p=9000:80 ameenalam/nodeapp:latest`

#### For Test

  ` $ curl http://localhost:9000`

*Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 9000. You will see the following web page.*

http://localhost:9000/

-----------------------------------

# Push images to Docker Cloud

*Docker Cloud uses Docker Hub as its native registry for storing both public and private repositories. Once you push your images to Docker Hub, they are available in Docker Cloud.*

__In order to get you started, let us get you a Docker ID.__

https://hub.docker.com/

> Log in to Docker Cloud using the docker login command.

`$ docker login`

> Tag your image using docker tag.

`$ docker tag image_name username/image_name`

> Push your image to Docker Hub using docker push (making the same replacements as in the previous step).

 $ docker push username/image_name


*Check that the image you just pushed appears in Docker Cloud.
Go to Docker Cloud and navigate to the Repositories tab and confirm that your image appears in this list.*
