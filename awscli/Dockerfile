FROM stackbrew/debian:wheezy

MAINTAINER yaronr

# install the ec2 cli tools
RUN apt-get update && \
    apt-get -y install  awscli groff-base && \
    apt-get clean

#ENTRYPOINT ["aws"]
