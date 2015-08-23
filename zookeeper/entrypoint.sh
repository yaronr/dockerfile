#!/bin/bash

if [[ -n $ZOOKEEPER_ID ]] ; then
  echo "Setting zookeeper ID to: $ZOOKEEPER_ID"
  echo "$ZOOKEEPER_ID" > /tmp/zookeeper/myid
else
  echo "ZOOKEEPER_ID must be specified"
  exit 1
fi

exec "$@"
