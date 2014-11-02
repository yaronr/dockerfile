FROM ubuntu:trusty

MAINTAINER yaronr

# install the ec2 cli tools
RUN apt-get update && \
    apt-get install -yq --no-install-recommends  awscli groff-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp

#ENTRYPOINT ["aws"]
