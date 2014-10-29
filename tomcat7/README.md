docker image for tomcat7 (with OpenJDK JRE)
based off of stackbrew/debian:jessie

Note:  For Tomcat 7 with Oracle JRE, use mbentley/debian-tomcat7-oracle

To pull this image:
`docker pull mbentley/debian-tomcat7`

Example usage:
`docker run -p 8080 -d mbentley/debian-tomcat7`

To deploy a specific .war file to ROOT, see the commented out section of the `Dockerfile`.

The following environment variables can be passed to the docker image:

`ADMIN_USER` (default: admin)

`ADMIN_PASS` (default: tomcat)

`MAX_UPLOAD_SIZE` (default: 52428800)

`CATALINA_OPTS` (default: "-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m")

If you would like to start tomcat without any applications deployed and have a local volume mounted to be be able to deploy a .war file by dropping it in, here is an example of that process:
```
mkdir -p /data/tomcat_webapps
docker run -i -t -p 8080 -v /data/tomcat_webapps:/opt/tomcat/webapps mbentley/debian-tomcat7
cp helloworld.war /data/tomcat_webapps/ROOT.war

```
