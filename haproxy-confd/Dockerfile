FROM stackbrew/debian:wheezy

MAINTAINER yaronr

ENV ETCD_NODE 172.17.42.1:4001

RUN (echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup) && \
	(echo "exit 101" > /usr/sbin/policy-rc.d) && \
	(echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	(echo "deb http://cdn.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list)

# Expose ports.
EXPOSE 80
EXPOSE 8080
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]

RUN	DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    	ca-certificates \
		software-properties-common python-software-properties \
		haproxy -t wheezy-backports \
		wget && \
		apt-get remove --purge -y software-properties-common python-software-properties && \
		apt-get clean && \
		rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
		sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy

ADD entrypoint.sh /entrypoint.sh
ADD confd /etc/confd

RUN wget -q https://github.com/kelseyhightower/confd/releases/download/v0.7.0-beta1/confd-0.7.0-linux-amd64 -O /bin/confd && \
	chmod +x /bin/confd