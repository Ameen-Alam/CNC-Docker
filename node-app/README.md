*Instruction that is used to build an image. Use the docker image build command to create a new image using the instructions contained in the Dockerfile. This example creates a new Docker image called name:tag. Be sure to perform this command from within the directory containing the app code and Dockerfile.*

#### Build Image

> <code> docker build -t &lt;image_name&gt;:&lt;tag&gt; &lt;source_of_Dockerfile&gt;</code>

  `$ docker build -t node-app:latest .`

#### Docker images list

  `$ docker image ls`

#### Run Container

> <code> docker run -d --name &lt;container_name&gt; -p &lt;host_port&gt;:&lt;container_port&gt; &lt;image_name&gt;:&lt;tag&gt;</code>

  `$ docker container run -d --name=web1 -p=9000:8080 node-app:latest`

#### For Test

  ` $ curl http://localhost:9000`

*Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 9000. You will see the following web page.*

> http://localhost:9000