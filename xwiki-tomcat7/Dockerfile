FROM yaronr/tomcat7
MAINTAINER yaronr

ENV XWIKI_VER 6.2.3
ENV TOMCAT_HOME /opt/tomcat

#Unfortunately, this also installs Mysql client, server, tomcat, and pearl... 
#RUN wget -q "http://maven.xwiki.org/public.gpg" -O- | apt-key add - && \
#	wget "http://maven.xwiki.org/stable/xwiki-stable.list" -P /etc/apt/sources.list.d/ && \
#	apt-get update && \
#	apt-get install -y xwiki-enterprise-common && \
#	apt-get clean

RUN	wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/xwiki.war "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-${XWIKI_VER}.war" && \
    unzip -q /tmp/xwiki.war -d "${TOMCAT_HOME}/webapps/xwiki" && \
    rm /tmp/xwiki.war && \
	wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/mysql-connector-java.tar.gz "http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.33.tar.gz" && \
	tar xzf  /tmp/mysql-connector-java.tar.gz -C ${TOMCAT_HOME}/webapps/xwiki/WEB-INF/lib && \
	rm /tmp/mysql-connector-java.tar.gz

ADD ./hibernate.cfg.xml "${TOMCAT_HOME}/webapps/xwiki/WEB-INF"

# OK I don't have the time right now to handle the following as -e envs through a start / configure script:
#ENV connection.url 
#ENV connection.username 
#ENV connection.password 
#ENV connection.driver_class 
#ENV dialect 
#ENV dbcp.ps.maxActive 

