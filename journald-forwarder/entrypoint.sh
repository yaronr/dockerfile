#!/bin/bash

if [[ -n $MULTICLOUD_DNS && -n MULTICLOUD_DNS_SEARCH ]] ; then
  echo "Replacing /etc/resolv.conf with:"
  echo "nameserver $MULTICLOUD_DNS" 
  echo "search $MULTICLOUD_DNS_SEARCH"
  echo "nameserver $MULTICLOUD_DNS" > /etc/resolv.conf
  echo "search $MULTICLOUD_DNS_SEARCH" >> /etc/resolv.conf
fi;

exec "$@"
