FROM stackbrew/debian:wheezy
MAINTAINER yaronr

RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends ssh libio-socket-ssl-perl ddclient && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add configuration files
ADD         ddclient /etc/default/ddclient
ADD         ddclient.conf /etc/ddclient.conf
ADD         entrypoint.sh /opt/entrypoint.sh
RUN         chmod +x /opt/entrypoint.sh

ENTRYPOINT  ["/opt/entrypoint.sh"]