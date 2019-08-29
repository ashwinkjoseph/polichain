#!/bin/sh

source /app/projects/network/1startnode.sh && echo "started node 1" && ps -ef | grep -i geth && ls /app/projects/network/1node
source /app/projects/network/2startnode.sh && echo "started node 2" && ps -ef | grep -i geth && ls /app/projects/network/2node
source /app/projects/network/3startnode.sh && echo "started node 3" && ps -ef | grep -i geth && ls /app/projects/network/3node
source /app/projects/network/4startnode.sh && echo "started node 4" && ps -ef | grep -i geth && ls /app/projects/network/4node
source /app/projects/network/5startnode.sh && echo "started node 5" && ps -ef | grep -i geth && ls /app/projects/network/5node

echo "ls /app/projects/network/1node"
ls /app/projects/network/1node

echo "ls /app/projects/network"
ls /app/projects/network