#!/bin/bash

set -eo pipefail

echo "That was a good nap. Now to work..."
netcat "$@"
