#!/bin/bash

set -eo pipefail

sed "s/^elasticsearch:.*/elasticsearch: http:\/\/$1:$2/" -i /opt/kibana/config/kibana.yml

echo "Taking a nap, to allow weave network to properly set up.."
sleep 10

echo "That was a good nap. Now to work..."
/opt/kibana/bin/kibana
