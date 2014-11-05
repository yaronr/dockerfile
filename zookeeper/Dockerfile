FROM yaronr/openjdk-7-jre
MAINTAINER yaronr

ENV ZOOKEEPER_VER 3.4.6

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VER}/zookeeper-${ZOOKEEPER_VER}.tar.gz | tar -xzf - -C /opt && \
    mv /opt/zookeeper-${ZOOKEEPER_VER} /opt/zookeeper && \
    rm /opt/zookeeper/conf/zoo_sample.cfg && \
    mkdir -p /tmp/zookeeper 

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]

ADD ./zoo.cfg /opt/zookeeper/conf/
