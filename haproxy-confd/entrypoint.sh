#!/bin/bash

if [ -z "$ETCD_NODE" ]
then
  echo "Missing ETCD_NODE env var"
  exit -1
fi

set -eo pipefail

#confd will start haproxy, since conf will be different than existing (which is null)

echo "[haproxy-confd] booting container. ETCD: $ETCD_NODE"

function config_fail()
{
	echo "Failed to start due to config error"
	exit -1
}

# Loop until confd has updated the haproxy config
n=0
until confd -onetime -node "$ETCD_NODE"; do
  if [ "$n" -eq "4" ];  then config_fail; fi
  echo "[haproxy-confd] waiting for confd to refresh haproxy.cfg"
  n=$((n+1))
  sleep $n
done

echo "[haproxy-confd] Initial HAProxy config created. Starting confd"

confd -node "$ETCD_NODE"
