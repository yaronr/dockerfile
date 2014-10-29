
The following environment variables can be passed to the docker image:

`ADMIN_USER` (default: admin)

`ADMIN_PASS` (default: tomcat)

`MAX_UPLOAD_SIZE` (default: 52428800)
 
`CATALINA_OPTS`  mandatory, and must include the following -D params: connection.url, connection.username, connection.password

-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m -Dconnection.url=jdbc:mysql://<your_DB_URL>/<DB_name> -Dconnection.username= -Dconnection.password=