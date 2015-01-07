#!/bin/bash

echo "Taking a nap, to allow weave network to properly set up.."
sleep 10

echo "That was a good nap. Now to work..."
exec "$@"
