```sh
$ docker run -v /full/path/to/html/directory:/usr/share/nginx/html:ro -p 8080:80 -d nginx:alpine
```

When we execute this command line, we see Docker download the Nginx image and then start the container.
We used four command line options to run this container:
	-	-v /full/path/to/html/directory:/usr/share/nginx/html:ro maps the directory holding our web page to the required location in the image. The ro field instructs Docker to mount it in read-only mode. It’s best to pass Docker the full paths when specifying host directories.
	-	-p 8080:80 maps network service port 80 in the container to 8080 on our host system.
	-	-d detaches the container from our command line session. we don’t want to interact with this container.
	-	nginx is the name of the image.
