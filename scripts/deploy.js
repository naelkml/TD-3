const { ethers, network } = require("hardhat");

async function main() {
  console.log("Déploiement de MonContrat...\n");

  const Factory = await ethers.getContractFactory("MonContrat");

  // Si ton constructor prend des arguments, ajoute-les ici : 
  // const contrat = await Factory.deploy("arg1", 42);
  const contrat = await Factory.deploy();

  await contrat.waitForDeployment();

  const adresse = await contrat.getAddress();
  console.log("✅ Contrat déployé à :", adresse);

  if (network.name === "sepolia") {
    console.log(
      "Etherscan :",
      `https://sepolia.etherscan.io/address/${adresse}`
    );
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});