pragma solidity >=0.4.22 <0.6.0;
contract FactCreator{
    mapping(string => address) facts;
    string[] factStrings;

    constructor() public {

    }

    function createFact(string memory fact) public {
        //conditions for checking for leaders
        require(msg.sender == 0x97606192305D0C7D574d6F1A5A019B1008B4CDfC, "Only the public facing nodes can create Facts");
        facts[fact] = address(new Fact());
        factStrings.push(fact);
    }

    function getFacts() public view returns (string memory returnValue) {
        string memory resultString = "";
        for(uint i = 0; i < factStrings.length; i = i + 1){
            resultString = string(abi.encodePacked(resultString, factStrings[i]));
            resultString = string(abi.encodePacked(resultString, ";"));
        }
        return resultString;
    }

    function getFactAddress(string memory _fact) public view returns (address){
        return facts[_fact];
    }

    function checkRightToVote(address _sender) public pure returns (bool) {
        //TO BE REPLACED BY CONDITIONAL CHECKS FOR EVERY LEADER
        bool cond1 = _sender == 0x1707B4AC6D0d982A9f70d75028EB472863bA3d01;
        bool cond2 = _sender == 0xC3e84a98df9416C6B9C79412232c94A5d3129a64;
        bool cond3 = _sender == 0x05168131Bc32D1422bCD8493e793C1a59EeFf0B4;
        if(cond1 || cond2 || cond3 ){
            return true;
        }else{
            return false;
        }
    }
}
contract Fact {

    uint8 voteCount;
    FactCreator creator;

    struct Voter {
        bool voted;
        uint8 pVoteNumber;
        uint8 nVoteCount;
        uint8 vote;
        address voterAddr;
    }

    mapping(address => Voter) voters;

    constructor() public {
        creator = FactCreator(msg.sender);
        voteCount = 0;
    }

    function vote() public {
        require(creator.checkRightToVote(msg.sender), "You are not Authorised to vote");
        if(voters[msg.sender].voted){
            if(voters[msg.sender].vote == 1){
                voteCount = voteCount - 1;
            }
        }
        voters[msg.sender].voted = true;
        voters[msg.sender].voterAddr = msg.sender;
        voters[msg.sender].pVoteNumber = voters[msg.sender].pVoteNumber + 1;
        voters[msg.sender].vote = 1;
        voteCount = voteCount + 1;
    }

    function deVote() public {
        require(creator.checkRightToVote(msg.sender), "You are not Authorised to vote");
        if(voters[msg.sender].voted){
            if(voters[msg.sender].vote == 2){
                voteCount = voteCount + 1;
            }
        }
        voters[msg.sender].voted = true;
        voters[msg.sender].voterAddr = msg.sender;
        voters[msg.sender].nVoteCount = voters[msg.sender].nVoteCount + 1;
        voters[msg.sender].vote = 2;
        voteCount = voteCount - 1;
    }

    function getVotes() public view returns (uint8) {
        return voteCount;
    }
}