FROM multicloud/netcat
MAINTAINER yaronr

#Ignore /etc/hosts. Resolve this host via DNS
RUN sed 's/^\(hosts:[\ ]*\)\(files\)\ \(dns\)$/\1\3 \2/' -i /etc/nsswitch.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
