#!/bin/bash

if [[ -n $MULTICLOUD_DNS && -n MULTICLOUD_DNS_SEARCH ]] ; then
  echo "Replacing /etc/resolv.conf with:"
  echo "$MULTICLOUD_DNS" 
  echo "$MULTICLOUD_DNS_SEARCH"
  echo "$MULTICLOUD_DNS" > /etc/resolv.conf
  echo "$MULTICLOUD_DNS_SEARCH" >> /etc/resolv.conf
fi;

echo "Taking a nap, to allow weave network to properly set up.."
sleep 10

echo "That was a good nap. Now to work..."
exec "$@"
