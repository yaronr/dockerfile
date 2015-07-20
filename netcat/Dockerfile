FROM multicloud/debian-wheezy
MAINTAINER yaronr

RUN	DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends netcat && \
		apt-get clean && \
		rm -rf /var/cache/apt/* /var/lib/apt/lists/* 

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]