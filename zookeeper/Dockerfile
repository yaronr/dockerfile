FROM multicloud/jre-8-oracle
MAINTAINER yaronr

#ENV ZOOKEEPER_VER 3.4.6
ENV ZOOKEEPER_VER release-3.5.1-rc4

RUN wget --no-check-certificate --progress=bar:force --retry-connrefused -t 5 https://github.com/apache/zookeeper/archive/${ZOOKEEPER_VER}.tar.gz -O /tmp/zookeeper.tar.gz && \
    (cd /tmp && tar zxf zookeeper.tar.gz && mv zookeeper-* /opt/zookeeper && \
    rm zookeeper.tar.gz && \
    mkdir -p /tmp/zookeeper)

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
