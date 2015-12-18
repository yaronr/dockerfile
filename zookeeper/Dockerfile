FROM multicloud/jre-8-oracle
MAINTAINER yaronr

ENV ZOOKEEPER_VER 3.4.7

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VER}/zookeeper-${ZOOKEEPER_VER}.tar.gz | tar -xzf - -C /opt && \
    mv /opt/zookeeper-${ZOOKEEPER_VER} /opt/zookeeper && \
    rm /opt/zookeeper/conf/zoo_sample.cfg && \
    mkdir -p /tmp/zookeeper 

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]
ADD ./zoo.cfg /opt/zookeeper/conf/

#resolve hosts from DNS first
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh", "/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
