FROM stackbrew/debian:wheezy
MAINTAINER yaronr

RUN (echo "deb http://http.debian.net/debian/ wheezy main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ wheezy-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ wheezy/updates main contrib non-free" >> /etc/apt/sources.list)

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
