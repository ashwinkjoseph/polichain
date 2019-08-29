#!/bin/bash

echo "ls /app/projects/network/5node"
ls /app/projects/network/5node

PRIVATE_CONFIG=ignore geth --datadir /app/projects/network/5node --nodiscover --verbosity 5 --networkid 31338 --raft --raftport 60004 --raftjoinexisting 5 --rpc --rpcaddr 0.0.0.0 --rpcport 32004 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 31004

echo "ls /app/projects/network/5node"
ls /app/projects/network/5node