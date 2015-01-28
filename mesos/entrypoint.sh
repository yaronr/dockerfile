#!/bin/bash

echo "Taking a nap, to allow weave network to properly set up.."
sleep 10

if [[ -n $MULTICLOUD_RESOLV_CONF ]] ; then
  echo "Replacing /etc/resolv.conf with:"
  echo "$MULTICLOUD_RESOLV_CONF" 
  echo "$MULTICLOUD_RESOLV_CONF" > /etc/resolv.conf
fi;

echo "That was a good nap. Now to work..."
exec "$@"
