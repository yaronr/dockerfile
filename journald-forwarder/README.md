## Journald (and anything else, really) forwarder


Usage:

    ExecStart=/bin/bash -cx  ' \
        set -eo pipefail; \
        bridge_ip="$(ifconfig docker0 | grep \'inet \' | awk \'{ print $2}\')"; \
        /usr/bin/journalctl -o short -f |  /usr/bin/docker run \
        --name=yaronr/journald-forwarder \
        --rm \
        -ti \
        --net=host \
        -e MULTICLOUD_DNS=$bridge_ip \
        -e MULTICLOUD_DNS_SEARCH=${CLUSTER_NAME}.multicloud.local \
        ${DOCKER_IMAGE} logstash 8080 '


Optional:

-e MULTICLOUD_DNS=<your favorite DNS>
-e MULTICLOUD_DNS_SEARCH=<your favorite domain name>

The above would override the resolv.conf of the container (even if --net=host) with the values you specify.