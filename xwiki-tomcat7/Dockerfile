FROM yaronr/tomcat7
MAINTAINER yaronr

ENV XWIKI_VER 6.2.3
ENV MYSQL_CONN_VER 5.1.33
ENV TOMCAT_HOME /opt/tomcat

#Unfortunately, this also installs Mysql client, server, tomcat, and pearl... 
#RUN wget -q "http://maven.xwiki.org/public.gpg" -O- | apt-key add - && \
#	wget "http://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/ && \
#	apt-get update && \
#	apt-get install -y --no-install-recommends xwiki-enterprise-common && \
#	apt-get clean

RUN	wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/xwiki.war "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-${XWIKI_VER}.war" && \
    unzip -q /tmp/xwiki.war -d "${TOMCAT_HOME}/webapps/xwiki" && \
    rm /tmp/xwiki.war && \
	wget --progress=bar:force --retry-connrefused -t 5 -P /tmp "http://central.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_CONN_VER}/mysql-connector-java-${MYSQL_CONN_VER}.jar" && \
	mv  /tmp/mysql-connector-java*.jar ${TOMCAT_HOME}/webapps/xwiki/WEB-INF/lib
	
ADD ./hibernate.cfg.xml ${TOMCAT_HOME}/webapps/xwiki/WEB-INF/
ADD ./xwiki.properties ${TOMCAT_HOME}/webapps/xwiki/WEB-INF/

# OK I don't have the time right now to handle the following as -e envs through a start / configure script:
#ENV connection.url 
#ENV connection.username 
#ENV connection.password 
#ENV connection.driver_class 
#ENV dialect 
#ENV dbcp.ps.maxActive 

