# Deploy Application using Docker with Nginx

[Docker Deep Dive Book PDF](/Docker%20Deep%20Dive.pdf)

### Docker Tutorial

> https://www.youtube.com/playlist?list=PLRnB5kp_ilgbsl8hJwhQXmSos8Ua9Tc_d
------------------

> https://github.com/Ameen-Alam/CNC-Docker.git Clone the sample app from GitHub.

`$ git clone https://github.com/Ameen-Alam/CNC-Docker.git`

**The clone operation creates a new directory called CNC-Docker . Change directory into CNC-Docker and list its contents.**

`$ cd CNC-Docker`

> Available Multiple Image Directories (001-static --to-- 010-mongoDB)

`$ cd 001-static`

__two way to run a container__
<ul>
 <li>The Ops perspective</li>
 <li>The Dev perspective</li>
</ul>

--------------------------------

### Start The Ops Perspective

*If you are working from a freshly installed Docker host it will have no images and will look like the output above.
Getting images onto your Docker host is called “pulling”. If you are following along with Linux, pull the ameenalam/nodeapp:latest.*

#### To pull an image

> <code> docker pull &lt;image_name&gt;:&lt;tag&gt;</code>

  `$ docker image pull ameenalam/nodeapp:latest`

#### Docker images list

  `$ docker image ls`

#### Run Container

> <code> docker run -d --name &lt;container_name&gt; -p &lt;host_port&gt;:&lt;container_port&gt; &lt;image_name&gt;:&lt;tag&gt;</code>

  `$ docker container run -d --name=web2 -p=7000:8080 ameenalam/nodeapp:latest`

#### For Test

  ` $ curl http://localhost:7000`

*Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 7000. You will see the following web page.*

http://localhost:7000/

-----------------------------------

# Push images to Docker Cloud

*Docker Cloud uses Docker Hub as its native registry for storing both public and private repositories. Once you push your images to Docker Hub, they are available in Docker Cloud.*

__In order to get you started, let us get you a Docker ID.__

https://hub.docker.com/

#### Docker login 

> Log in to Docker Cloud using the docker login command.

`$ docker login`

#### Tag Image

> Tag your image using docker tag.

`$ docker tag image_name username/image_name`

#### Push your image to Docker Hub

> Push your image to Docker Hub using docker push (making the same replacements as in the previous step).

 `$ docker push username/image_name`


*Check that the image you just pushed appears in Docker Cloud.
Go to Docker Cloud and navigate to the Repositories tab and confirm that your image appears in this list.*
