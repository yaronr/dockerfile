#!/bin/bash

set -eo pipefail

sed "s/^elasticsearch_url:.*/elasticsearch_url: http:\/\/${elasticsearch_server_url}:${elasticsearch_server_port}/" -i /opt/kibana/config/kibana.yml

/opt/kibana/bin/kibana
