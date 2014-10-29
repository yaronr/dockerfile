FROM stackbrew/debian:wheezy

MAINTAINER yaronr

RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

ENV TOMCATVER 7.0.56

RUN (wget --retry-connrefused -t 5 -O /tmp/tomcat7.tar.gz http://apache.mivzakim.net/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz  && \
    cd /opt && \
    tar zxf /tmp/tomcat7.tar.gz && \
    mv /opt/apache-tomcat* /opt/tomcat && \
    rm /tmp/tomcat7.tar.gz) && \
    rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT

ADD ./run.sh /usr/local/bin/run

#ADD yourfile.war /opt/tomcat/webapps/ROOT.war


# User limits
RUN sed -i.bak '/\# End of file/ i\\# Following 2 lines added by Dockerfile' /etc/security/limits.conf
RUN sed -i.bak '/\# End of file/ i\\*                hard    nofile          65536' /etc/security/limits.conf
RUN sed -i.bak '/\# End of file/ i\\*                soft    nofile          65536\n' /etc/security/limits.conf


EXPOSE 8080

CMD ["/bin/bash", "-e", "/usr/local/bin/run"]