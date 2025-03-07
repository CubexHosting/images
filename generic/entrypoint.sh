#!/bin/bash

cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $(NF-2);exit}'`

# Replace Startup variables.
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo "customer@cubex:~# ${MODIFIED_STARTUP}"

# Run the Server.
eval ${MODIFIED_STARTUP}