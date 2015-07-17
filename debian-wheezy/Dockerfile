FROM stackbrew/debian:wheezy
MAINTAINER yaronr

RUN (echo "deb http://cdn.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list) && \
	(echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list) && \
	(echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list) && \
	(echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq --no-install-recommends && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends wget zip unzip nano curl  && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends --reinstall procps && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /var/lib/apt/lists/*
