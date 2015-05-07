FROM yaronr/debian-jessie
MAINTAINER yaronr

# Setup
# Mesos fetcher uses unzip to extract staged zip files
# for lsb, see http://affy.blogspot.co.il/2014/11/is-using-lsbrelease-cs-good-idea-inside.html
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
	DISTRO=debian && \
	CODENAME=wheezy && \
	echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | tee /etc/apt/sources.list.d/mesosphere.list && \
	DEBIAN_FRONTEND=noninteractive apt-get -y update && \
	apt-get -y install -yq --no-install-recommends mesos marathon chronos unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm /etc/mesos/zk && \
    rm /etc/mesos-master/quorum 

#Ignore /etc/hosts. Resolve this host via DNS
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
