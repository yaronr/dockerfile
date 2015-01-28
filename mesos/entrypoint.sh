#!/bin/bash

if [[ -n $MULTICLOUD_DNS && -n MULTICLOUD_DNS_SEARCH ]] ; then
  echo "Replacing /etc/resolv.conf with:"
  echo "nameserver $MULTICLOUD_DNS" 
  echo "search $MULTICLOUD_DNS_SEARCH"
  echo "nameserver $MULTICLOUD_DNS" > /etc/resolv.conf
  echo "search $MULTICLOUD_DNS_SEARCH" >> /etc/resolv.conf
fi;

echo "Taking a nap, to allow weave network to properly set up.."
sleep 10

echo "That was a good nap. Now to work..."
exec "$@"
