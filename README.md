# Polichain

Polichain is a platform that verifies political facts put on the platform through a voting mechanism where the participants in the voting process are each having their own interests and views which are at times opposing in nature. 
We further reinforce the desire in the participants to vote for their own interests and prevent the tendency for them to collaborate with each other by introducing an incentivizing factor to the system.

*This is a POC and is not a full implementation of the platform*

## Roles ##
In polichain, there are three major roles:-
* General Public
* Voters
* Moderators

### General Public ###
Any common person who wants to exercise their right to express their views and concerns about the political system they live in and wish to have access to unbiased information about what is going on in the political system they live in. 

The general public can voice out their opinion by putting up facts on our platform, read the facts that exist on the platform, can see the no.of votes for and against each fact, see who voted what. 

The general public doesn't have to be part of the blockchain network, Polichain will have a dedicated node for the public which is accessible to the general public. However, if any of the general public wishes to be part of the system, they can do so by registering themselves on the platform and running the necessary tools to host the blockchain on their systems.

### Voters ###
The politicians who form the government, about whom the facts are being put up. 
The voters can see the facts being put up and can vote in favor of the fact if it is true and against the fact if it is false, where the concept of truth is relative to each voter.

The voters who wish to be part of the platform are added to the blockchain network and have their own accounts. Each voter has to host a copy of the blockchain.

The voters are incentivised not to form agreements among each other and cause bias in the verification of facts through the concept of an incentivising factor that affects the power of a vote given by a certain voter. This incentivizing factor is further explained in the section “The Incentivizing Factor”.

The blockchain will record every vote cast by the politician and the votes can’t be altered (the voters who cast the vote can later change their opinion and give a new vote in which case only the latest vote from the voter will be taken into consideration for the calculation of the total number of votes for and against a given fact, but the vote itself that the user had previously cast will not be removed or altered)

### Moderators ### 
The Organisations who were set up in the real world with the sole purpose of moderating elections and politicians such as the “Electoral Commission”. Moderators serve the purpose by making sure that the verification process is unbiased such that the facts that are put up on the platform are being verified without any bias.
Moderators have the same capabilities as a voter but the difference is that the votes of a moderator are given more weightage than that given by a voter.The significance of this fact and the purpose it serves is explained in detail in the “The Incentivizing Factor” Section.

## Limitations of POC ##
This is a POC of polichain and not the full implementation of polichain.
The limitations of this POC Compared to the full implementation of polichain are compared in the table below

Full Implementation | POC
------------------- | ------
Allows for Voters (Politicians to be dynamically added after deployement by the admin) | The List of participants are hard coded
Allows for the General Public to dynamically join as validator nodes (without permission to vote) without the permission of the admin | There is only one node available for the public to create facts through, which is provided at the time of creation of the blockchain
Will be implemented on Hyperledger Fabric | Is implemented on Quorum
Weights assosciated with each voter will change dynamically based on the voter's past performance | Weights are all static and are set to 1

## How to get started with this repo ##

Due to the limitations of the POC which have been mentioned above, the nodes in the network are also committed in this repo.
For successfully testing the POC, the same nodes have to be used.

### Docker ###

Each node has been written as a docker service along with the service for connecting to each of their consoles.

The platform can be built from the `docker-compose` file by executing the command `docker-compose up`

To Execute the tests, execute the command `docker-compose run testService`
The tests can be found in the `test` directory of this repository

### Without Docker ###

To run the POC without docker, you would have to go through the process of 
* [Set up golang on your system](https://golang.org/dl/ "Installing GoLang") *At the time of writing this, quorum had issues with goland 1.12, the recomended version is 1.11*
* [Set up quorum on your system](https://docs.goquorum.com/en/latest/Getting%20Started/Installing/ "Installing Quorum")
* [Setup Node.js](https://nodejs.org/en/ "Node.js Download Link")
* execute `npm i -g truffle` *At the time of writing this, truffle had problems interacting with quorum. The version of truffle that worked for me was v5.0.33*
* execute `chmod +x <path to project>/network/1startnodesh`
* execute `chmod +x <path to project>/network/2startnodesh`
* execute `chmod +x <path to project>/network/3startnodesh`
* execute `chmod +x <path to project>/network/4startnodesh`
* execute `chmod +x <path to project>/network/5startnodesh`
* execute `./1startnode.sh`
* execute `./2startnode.sh`
* execute `./3startnode.sh`
* execute `./4startnode.sh`
* execute `./5startnode.sh`
* execute `truffle compile`
* execute `truffle test --network node1` for testing voter nodes
* execute `truffle test --network node5` for testing public nodes
