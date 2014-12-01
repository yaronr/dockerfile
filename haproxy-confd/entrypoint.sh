#!/bin/bash

if [ -z "$ETCD_NODE" ]
then
  echo "Missing ETCD_NODE env var"
  exit -1
fi

set -eo pipefail

#confd will start haproxy, since conf will be different than existing (which is null)

echo "[haproxy-confd] booting container. ETCD: $ETCD_NODE"

# Loop until confd has updated the haproxy config

until confd -onetime -node $ETCD_NODE; do
  echo "[haproxy-confd] waiting for confd to refresh haproxy.cfg"
  sleep 5
done

confd -node $ETCD_NODE
