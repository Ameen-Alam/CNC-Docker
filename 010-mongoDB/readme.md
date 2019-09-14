### The docker run -d -p 27017:27107 -v ~/data:/data/db mongo does 3 main things:

```sh
$ docker run -d -p 27017:27107 -v ~/data:/data/db mongo
```

- -d tells docker to run the container as a daemon, which is the mode that'll you want to use for server containers.
- -p 27017:27107 maps the port 27017 of the container to the port 27017 of the host. The syntax is -p HOST_PORT:CONTAINER_PORT.
- -v ~/data:/data/db maps the /data/db directory of the container to the ~/data directory on the host. This is called a data volume, the principal mechanism to import and export data with your docker container.