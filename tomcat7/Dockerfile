FROM yaronr/openjdk-7-jre
MAINTAINER yaronr

ENV TOMCATVER 7.0.57
ENV MYSQL_CONNECTOR_JAVA_VER 5.1.34
ENV TOMCAT_HOME /opt/tomcat

RUN (wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/tomcat7.tar.gz http://apache.mivzakim.net/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz  && \
    cd /opt && \
    tar zxf /tmp/tomcat7.tar.gz && \
    mv /opt/apache-tomcat* ${TOMCAT_HOME} && \
    rm /tmp/tomcat7.tar.gz) && \
    rm -rf ${TOMCAT_HOME}/webapps/ && \
    mkdir ${TOMCAT_HOME}/webapps && \
    wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/mysql-connector-java.tar.gz http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VER}.tar.gz && \
    tar zxf /tmp/mysql-connector-java.tar.gz -C /tmp && \
    rm /tmp/mysql-connector-java.tar.gz && \
    mv /tmp/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VER}/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VER}-bin.jar /opt/tomcat/lib/ && \
    rm -rf /tmp/mysql-connector-java-${MYSQL_CONNECTOR_JAVA_VER}
    
# 'Host manager' and 'manager' examples etc tomcat apps are are removed for security hardening

ADD ./run.sh /usr/local/bin/run

# RUN mv /etc/cron.daily/logrotate /etc/cron.hourly/logrotate
ADD logrotate /etc/logrotate.d/tomcat7
RUN chmod 644 /etc/logrotate.d/tomcat7

# User limits
RUN sed -i.bak '/\# End of file/ i\\# Following 2 lines added by Dockerfile' /etc/security/limits.conf && \
	sed -i.bak '/\# End of file/ i\\*                hard    nofile          65536' /etc/security/limits.conf && \
	sed -i.bak '/\# End of file/ i\\*                soft    nofile          65536\n' /etc/security/limits.conf

EXPOSE 8080

CMD ["/bin/bash", "-e", "/usr/local/bin/run"]

ADD ./server.xml ${TOMCAT_HOME}/conf/

#
#ADD yourfile.war ${TOMCAT_HOME}/webapps/ROOT.war
