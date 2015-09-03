FROM multicloud/jre-8-oracle
MAINTAINER yaronr

ENV version 1.4.2

RUN wget --progress=bar:force --no-check-certificate --retry-connrefused -t 5 https://download.elasticsearch.org/logstash/logstash/logstash-${version}.tar.gz -O /tmp/logstash.tar.gz && \
    (cd /tmp && tar zxf logstash.tar.gz && mv logstash-${version} /opt/logstash && \
    rm logstash.tar.gz) && \
    (cd /opt/logstash && \
    /opt/logstash/bin/plugin install contrib)

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

#sed is too complicated... really. give me a break
ADD /patterns/haproxy /opt/logstash/patterns/haproxy

EXPOSE 514 514/udp 
ENTRYPOINT ["/entrypoint.sh"]

#Ignore /etc/hosts
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf
