FROM stackbrew/debian:wheezy

MAINTAINER yaronr

RUN (echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup) && \
	(echo "exit 101" > /usr/sbin/policy-rc.d) && \
	(echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	(echo "deb http://cdn.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list)

RUN	DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    	netcat && \
		apt-get remove --purge -y software-properties-common python-software-properties && \
		apt-get clean && \
		rm -rf /var/cache/apt/* /var/lib/apt/lists/* 

#ENTRYPOINT ["ncat"]
