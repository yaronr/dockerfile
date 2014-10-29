FROM yaronr/openjdk-7-jre
MAINTAINER yaronr

ENV TOMCATVER 7.0.56
ENV TOMCAT_HOME /opt/tomcat

RUN (wget --progress=bar:force --retry-connrefused -t 5 -O /tmp/tomcat7.tar.gz http://apache.mivzakim.net/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz  && \
    cd /opt && \
    tar zxf /tmp/tomcat7.tar.gz && \
    mv /opt/apache-tomcat* ${TOMCAT_HOME} && \
    rm /tmp/tomcat7.tar.gz) && \
    rm -rf ${TOMCAT_HOME}/webapps/docs ${TOMCAT_HOME}/webapps/examples ${TOMCAT_HOME}/webapps/ROOT

ADD ./run.sh /usr/local/bin/run

# User limits
RUN sed -i.bak '/\# End of file/ i\\# Following 2 lines added by Dockerfile' /etc/security/limits.conf && \
	sed -i.bak '/\# End of file/ i\\*                hard    nofile          65536' /etc/security/limits.conf && \
	sed -i.bak '/\# End of file/ i\\*                soft    nofile          65536\n' /etc/security/limits.conf

EXPOSE 8080

CMD ["/bin/bash", "-e", "/usr/local/bin/run"]

ADD ./server.xml ${TOMCAT_HOME}/conf/

#
#ADD yourfile.war ${TOMCAT_HOME}/webapps/ROOT.war
