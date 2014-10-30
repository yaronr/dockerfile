
# xWiki-Tomcat7

### This is a xWiki-Tomcat7 docker setup that's opinionated towards an external MySQL server.

The following environment variables can be passed to the docker image:

`MAX_UPLOAD_SIZE` (default: 52428800)
 
`CATALINA_OPTS`  mandatory, and must include the following -D params: `hibernate.connection.url=jdbc:mysql://<your_DB_URL>/<DB_name>, hibernate.connection.username=.., hibernate.connection.password=..`
  


State in xWiki is stored at the Database (mainly), and file system (extensions, etc).

For xWiki to really be ephemeral, you need to figure out a way to persist and sync the file-system state between runs / instances.

environment.permanentDirectory defines the folder where file-system 'state' is stored.

environment.permanentDirectory has been set to /var/local/xwiki/
You may choose to -v mount that directory and map it to a docker volume container or the host.

To connect to different databases - change the hibernate.cfg.xml. -Dhibernate.* CATALINA_OPTS are equivalent to hibernate.cfg <properties>
In the future, the DB connection parameters could be set via -e env vars, but that requires tinkering with the startup script and 'sed', and I don't have time for that now.

### Example:
> docker run --name=${CONTAINER_NAME} -p 8080:8080 -e CATALINA_OPTS="-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m -Dhibernate.connection.url=jdbc:mysql://my-db:3306/xwiki -Dhibernate.connection.username=xwiki -Dhibernate.connection.password=p4ssw0rd" yaronr/xwiki-tomcat7