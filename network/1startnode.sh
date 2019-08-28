#!/bin/bash
PRIVATE_CONFIG=ignore nohup geth --datadir 1node --nodiscover --verbosity 5 --networkid 31338 --raft --raftport 60000 --rpc --rpcaddr 0.0.0.0 --rpcport 32000 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 31000 >> node.log 2>&1 &
