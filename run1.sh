#!/bin/sh

source /app/projects/network/1startnode.sh && echo "started node 1" && ps -ef | grep -i geth && ls /app/projects/network/1node