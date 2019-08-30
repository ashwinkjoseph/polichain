#!/bin/bash

# echo "ls /app/projects/network/2node"
# ls /app/projects/network/2node

PRIVATE_CONFIG=ignore geth --datadir 2node --nodiscover --verbosity 5 --networkid 31338 --raft --raftport 60001 --raftjoinexisting 2 --rpc --rpcaddr 0.0.0.0 --rpcport 32001 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 31001

# echo "After the initiation: "
# ls /app/projects/network/2node