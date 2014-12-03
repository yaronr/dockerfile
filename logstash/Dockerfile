FROM yaronr/openjdk-7-jre
MAINTAINER yaronr

ENV version 1.4.2

RUN wget --progress=bar:force --retry-connrefused -t 5 https://download.elasticsearch.org/logstash/logstash/logstash-${version}.tar.gz -O /tmp/logstash.tar.gz && \
    (cd /tmp && tar zxf logstash.tar.gz && mv logstash-${version} /opt/logstash && \
    rm logstash.tar.gz)

EXPOSE 514 514/udp 9292 
ENTRYPOINT ["/opt/logstash/bin/logstash"]
