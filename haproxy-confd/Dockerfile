FROM yaronr/debian-wheezy

MAINTAINER yaronr

ENV ETCD_NODE 172.17.42.1:4001
ENV confd_ver 0.7.1

ENTRYPOINT ["/entrypoint.sh"]

RUN	(echo "deb http://cdn.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list) && \
	DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    	ca-certificates \
    	libssl1.0.0 \
		software-properties-common python-software-properties \
		haproxy -t wheezy-backports && \
		apt-get remove --purge -y software-properties-common python-software-properties && \
		apt-get clean && \
		rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
		sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy

RUN wget --progress=bar:force --retry-connrefused -t 5 https://github.com/kelseyhightower/confd/releases/download/v${confd_ver}/confd-${confd_ver}-linux-amd64 -O /bin/confd && \
	chmod +x /bin/confd

ADD entrypoint.sh /entrypoint.sh
ADD confd /etc/confd
	
# Expose ports.
EXPOSE 8080
EXPOSE 8090
