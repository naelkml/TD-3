// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MonContrat {
// ── Variables d'état ──────────────────────────────────────────────────
address public owner;
uint256 public compteur;
mapping(address => uint256) public dernierAcces;
// ── Events ────────────────────────────────────────────────────────────
event ActionEffectuee(address indexed qui, uint256 valeur);
// ── Constructor ───────────────────────────────────────────────────────
constructor() {
owner = msg.sender; // l'adresse qui déploie = le propriétaire
}
// ── Lecture — gratuit, pas de gas ─────────────────────────────────────
function lireCompteur() external view returns (uint256) {
return compteur;
}
// ── Écriture — coûte du gas, MetaMask confirme ────────────────────────
function agir(uint256 valeur) external {
require(valeur > 0,
"La valeur doit etre positive");
require(
block.timestamp >= dernierAcces[msg.sender] + 1 minutes,
"Attends 1 minute entre deux actions"
);
compteur += valeur;
dernierAcces[msg.sender] = block.timestamp;
emit ActionEffectuee(msg.sender, valeur);
}
}