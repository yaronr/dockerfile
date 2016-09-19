FROM stackbrew/debian:wheezy
MAINTAINER yaronr

ENV AWS_ACCESS_KEY_ID foobar_aws_key_id
ENV AWS_SECRET_ACCESS_KEY foobar_aws_access_key
ENV INOTIFYWAIT_EXCLUDE 'matchnothing^'

RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list) && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends ntpdate inotify-tools python-paramiko python-gobject-2 python-boto duplicity && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME /var/backup

ADD ./run.sh /run.sh
ENTRYPOINT ["/run.sh"]
