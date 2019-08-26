const FactCreator = artifacts.require("FactCreator");

module.exports = function(deployer) {
  deployer.deploy(FactCreator);
};
