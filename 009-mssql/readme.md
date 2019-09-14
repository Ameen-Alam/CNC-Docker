```sh
$ docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=mypassword" -e "MSSQL_PID=Express" -p 1433:1433 -v /path/your/myfolder:/var/opt/mssql --name HIMS-WEB -d microsoft/mssql-server-linux:latest
```