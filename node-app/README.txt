Instruction that is used to build an image. Use the docker image build command to create a new image using the instructions contained in the Dockerfile. This example creates a new Docker image called name:tag. Be sure to perform this command from within the directory containing the app code and Dockerfile.

$ docker build -t node-app:latest .

Check to make sure that the new static-web:latest image exists on your host.

$ docker image ls

You now have a newly built image with the app inside. Run a container from the image and test the app.

$ docker container run -d --name=web1 -p=9000:8080 node-app:latest

Open a web browser and navigate to the DNS name or IP address of the host that you are running the container from and point it to port 8080. You will see the following web page.

http://localhost:9000/