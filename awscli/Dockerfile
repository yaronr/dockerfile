FROM stackbrew/debian:wheezy

MAINTAINER yaronr

# install the ec2 cli tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends awscli groff-base && \
    apt-get clean

#ENTRYPOINT ["aws"]
