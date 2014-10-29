FROM ubuntu:latest

MAINTAINER yaronr

RUN apt-get update && \
    apt-get install -y perl curl wget unzip libdigest-hmac-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install s3-curl
RUN wget http://s3.amazonaws.com/doc/s3-example-code/s3-curl.zip && \
    unzip s3-curl && \
    mv /s3-curl/s3curl.pl /usr/local/bin/s3curl.pl && \
    chmod +x /usr/local/bin/s3curl.pl && \
    rm s3-curl.zip && \
    rm -rf s3-curl

RUN s3curl.pl --id=$AWS_ACCESS_KEY_ID --key=$AWS_ACCESS_KEY_SECRET -- $S3_FILE_URL -vv -O



