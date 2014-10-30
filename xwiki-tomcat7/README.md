
This is an xWiki-Tomcat7 docker setup that's opinionated towards an external MySQL server.

The following environment variables can be passed to the docker image:

`MAX_UPLOAD_SIZE` (default: 52428800)
 
`CATALINA_OPTS`  mandatory, and must include the following -D params: hibernate.connection.url, hibernate.connection.username, hibernate.connection.password
-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m -Dhibernate.connection.url=jdbc:mysql://<your_DB_URL>/<DB_name> -Dhibernate.connection.username= -Dhibernate.connection.password=..

To connect to different databases - change the hibernate.cfg.xml. -Dhibernate.* CATALINA_OPTS are equivalent to hibernate.cfg <properties>
In the future, the DB connection parameters could be set via -e env vars, but that requires tinkering with the startup script and 'sed', and I don't have time for that now.
