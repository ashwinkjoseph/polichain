const FactCreator = artifacts.require("FactCreator")
const Fact = artifacts.require("Fact")

contract('FactCreator', function(accounts) {
  it("Should Allow Creation of Facts", async function() {
    var test_public_nodes = await FactCreator.deployed();
    try{
      let createdFact = await test_public_nodes.createFact("Hey, this is a Fact!");
      assert.isTrue(createdFact ? true : false);
    }catch(error){
      console.error(error);
      assert.isTrue(error.message);
    }
  })
  it("Should Allow Getting Facts", async function(){
    var instance = await FactCreator.deployed();
    try{
      let facts = await instance.getFacts();
      assert.isTrue(true);
    }catch(error){
      console.error(error);
      assert.isTrue(error.message);
    }
  })
  it("Should get the Fact Addresses", async function(){
    var instance = await FactCreator.deployed();
    try{
      let facts = await instance.getFacts();
      facts = facts.split(";");
      for(let fact of facts){
        if(fact.length){
          let factAddress = await instance.getFactAddress(fact);
          if(!factAddress){
            throw new Error("factAddress couldn't be retrieved!");
          }
        }
      }
      assert.isTrue(true);
    }catch(error){
      console.error(error);
      assert.isTrue(error.message);
    }
  })
  it("Should get the Fact Votes", async function(){
    var instance = await FactCreator.deployed();
    try{
      let facts = await instance.getFacts();
      facts = facts.split(";");
      for(let fact of facts){
        if(fact.length){
          let factAddress = await instance.getFactAddress(fact);
          if(!factAddress){
            throw new Error("factAddress couldn't be retrieved!");
          }
          let factInstance = await Fact.at(factAddress);
          let votes = await factInstance.getVotes();
        }
      }
      assert.isTrue(true);
    }catch(error){
      console.error(error);
      assert.isTrue(error.message);
    }
  })
  it("Should Not Allow for Voting", async function(){
    var instance = await FactCreator.deployed();
    try{
      let facts = await instance.getFacts();
      facts = facts.split(";");
      for(let fact of facts){
        if(fact.length){
          let factAddress = await instance.getFactAddress(fact);
          if(!factAddress){
            throw new Error("factAddress couldn't be retrieved!");
          }
          let factInstance = await Fact.at(factAddress);
          try{
            await factInstance.vote();
            await factInstance.deVote();
            throw new Error("The Contract Could Successfully Vote and DeVote");
          }catch(error){
            console.error("error: ", error);
            if(error.message=="The Contract Could Successfully Vote and DeVote"){
              throw error;
            }
          }
        }
      }
      assert.isTrue(true);
    }catch(error){
      console.error(error);
      assert.isTrue(error.message);
    }
  })
});
