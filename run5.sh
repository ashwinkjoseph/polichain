#!/bin/sh

ifconfig

source /app/projects/network/5startnode.sh && echo "started node 5" && ps -ef | grep -i geth && ls /app/projects/network/5node