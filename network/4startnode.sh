#!/bin/bash

echo "ls /app/projects/network/4node"
ls /app/projects/network/4node

PRIVATE_CONFIG=ignore geth --datadir /app/projects/network/4node --nodiscover --verbosity 5 --networkid 31338 --raft --raftport 60003 --raftjoinexisting 4 --rpc --rpcaddr 0.0.0.0 --rpcport 32003 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 31003

echo "ls /app/projects/network/4node"
ls /app/projects/network/4node