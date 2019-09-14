```sh
$ docker run -p 3306:3306 --name mysqlserver -e MYSQL_ROOT_PASSWORD=root -d -v /home/mysql-data:/var/lib/mysql mysql
```
#### Listing existing mounts
```sh
$ docker inspect mysqlserver
```
