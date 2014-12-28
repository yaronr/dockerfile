FROM redjack/mesos:0.21.0
MAINTAINER yaronr

# Mesos fetcher uses unzip to extract staged zip files

RUN \
  apt-get install -y unzip && \
  apt-get clean


#Ignore /etc/hosts
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
