
### Cheat Sheet

| Command | Description |
| ------ | ------ |
| docker pull &lt;image-name&gt;:&lt;tag&gt; | Pulls the image from the docker hub |
| docker build -t &lt;image-name&gt;:&lt;tag&gt;  . | Builds the image from the Dockerfile with the mentioned name and tag |
| docker image ls | Shows the list of the images present on your system. short-hand 'docker images' |
| docker container ls | Displays the only running containers. short-hand 'docker ps'  |
| docker container ls -a | Displays all the containers present on your system. short-hand 'docker ps  -a' |
| docker inspect &lt;image name&gt;:&lt;tag&gt; | Shows the detailed information about the image in JSON format. |
| docker history &lt;image name&gt;:&lt;tag&gt; | Used to inspect the layers of the image. |
| docker tag &lt;source-image&gt;:&lt;tag&gt; &lt;username/new-image-name&gt;:&lt;tag&gt; | Create a tag of the new image that refers to source image.  |
|docker push user/&lt;image-name&gt;:&lt;tag&gt; | Push an image to a registry |
| docker image rm &lt;image name&gt;:&lt;tag&gt; | Remove the image. short-hand 'docker rmi &lt;image name&gt;:&lt;tag&gt;' |
| docker run --name &lt;container_name&gt; -p &lt;host_port : container_port&gt; -d &lt;image_name&gt; | Create the container with the specified name and assign the specified port from the image. |
| docker run --name &lt;container-name&gt; -it -p &lt;host_port : container_port&gt; &lt;image-name&gt;:&lt;tag&gt; sh | To run a container from an image in an interactive mode. Press Ctrl + pq it will detach terminal and leave container running in background. |
| docker exec -it &lt;container_name&gt; sh | To go in the running container shell. Write exit to detach the terminal |
| docker stop container_name | It will stop the running container. |
| docker start container_name | Start the stopped container |
| docker rm container_name | Remove the container. |
| docker logs container_name | fetch the logs of the container |
| docker inspect container_name | Shows the detailed information about the container in JSON format. |
| docker volume create my-vol | Create your Volume for Persistent Data |
| docker volumes ls | List down the volumes |
| docker volume inspect my-vol | inspect the volumes |
| docker volumes rm my-vol | remove volume |
| docker run -d --name mycont -v my-vol:/usr/share/nginx/html nginx:latest | start container with -v flag (volume mount) |
| docker run -d --name devtest --mount source=my-vol,target=/usr/share/nginx/html nginx:latest | start container with --mount flag |
| docker run -d -it --name devtest -v "$(pwd)"/myfolder:/app nginx:latest | start container with bind mounts and -v flag |
| docker run -d -it --name devtest --mount type=bind,source="$(pwd)"/myfolder,target=/app nginx:latest | start container with bind mounts and -mount flag |

