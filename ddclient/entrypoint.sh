#!/bin/bash

if [ ! $# -gt 5 ]
  then
  	echo
    echo "Invalid / incorrect / missing arguments supplied."
    echo "Expected parameters:"
    echo
    echo "entrypoint.sh {dynamic_dns_server} {your_domain} {password} {dynamic_dns_protocol} {host} {sleep_interval_sec}"
    echo
    echo "Example:"
    echo "entrypoint.sh dynamicdns.park-your-domain.com mydomain.com 12345 namecheap www"
    echo
    echo "{sleep_interval_sec} default = 3600"
    echo "All other params are required."
    exit 1
fi

sleeptime=${6:-3600}

on_die()
{
	echo "Stopping..."
	exit 0
}

trap 'on_die' TERM SIGINT

sed -i 's/{dynamic_dns_server}/'$1'/' /etc/ddclient.conf &&
sed -i 's/{domain}/'$2'/' /etc/ddclient.conf &&
sed -i 's/{password}/'$3'/' /etc/ddclient.conf &&
sed -i 's/{protocol}/'$4'/' /etc/ddclient.conf &&
sed -i 's/{host}/'$5'/' /etc/ddclient.conf &&

while timeout 10 ddclient -daemon=0 -verbose | grep -i -q 'success'; do
    sleep $sleeptime
done

