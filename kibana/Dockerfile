FROM multicloud/jre-8-oracle
MAINTAINER yaronr

ENV version 4.1.1-linux-x64
ENV elasticsearch_server_url elasticsearch
ENV elasticsearch_server_port 9200

RUN wget --no-check-certificate --progress=bar:force --retry-connrefused -t 5 https://download.elasticsearch.org/kibana/kibana/kibana-${version}.tar.gz -O /tmp/kibana.tar.gz && \
    (cd /tmp && tar zxf kibana.tar.gz && mv kibana-* /opt/kibana && \
    rm kibana.tar.gz)

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/entrypoint.sh"]

#Ignore /etc/hosts
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf