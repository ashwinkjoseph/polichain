#!/bin/bash
PRIVATE_CONFIG=ignore nohup geth --datadir 3node --nodiscover --verbosity 5 --networkid 31338 --raft --raftport 60002 --raftjoinexisting 3 --rpc --rpcaddr 0.0.0.0 --rpcport 32002 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 31002 2>>node3.log &
