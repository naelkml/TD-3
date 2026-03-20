# 🚀 Smart Contract DApp — Hardhat + React (Sepolia)

## 📌 Description

Ce projet est une **application Web3 complète** comprenant :

- 🧠 Un **smart contract en Solidity**
- ⚙️ Un environnement de développement avec **Hardhat** et **Ganache**
- 🌐 Un déploiement sur le réseau de test **Sepolia**
- 🎨 Un **frontend React** connecté au contrat via **Ethers.js**

🎯 **Objectif :** comprendre le cycle complet d’une dApp  
👉 Écriture du contrat → Test local → Déploiement → Intégration frontend

---

## 🧱 Stack technique

- **Solidity** — Smart contract  
- **Hardhat** — Développement & déploiement  
- **Ganache** — Blockchain locale  
- **Alchemy** — Accès RPC Sepolia  
- **Sepolia** — Réseau Ethereum de test  
- **Ethers.js** — Interaction avec le contrat  
- **React** — Interface utilisateur  

---

## ⚙️ Fonctionnalités du Smart Contract

Le contrat respecte les contraintes suivantes :

- ✅ 2 fonctions `view` (lecture gratuite)  
- ✅ 1 fonction d’écriture (transaction on-chain)  
- ✅ 1 `event` (écouté côté frontend)  
- ✅ 1 `require()` (règle métier on-chain)  

### 💡 Exemple de logique

- Compteur global  
- Cooldown entre deux actions  
- Historique des actions via `event`  

---

## 📁 Structure du projet

```
mon-contrat/
├── contracts/          # Smart contracts Solidity
├── scripts/            # Scripts de déploiement
├── test/               # Tests (optionnel)
├── artifacts/          # ABI & bytecode générés
├── hardhat.config.js   # Configuration Hardhat
├── abi.json            # ABI exporté
└── .env                # Variables sensibles
```

---

## 🔧 Installation

### 1. Cloner le projet

```bash
git clone <repo>
cd mon-contrat
```

### 2. Installer les dépendances

```bash
npm install
```

### 3. Configurer les variables d’environnement

Créer un fichier `.env` à la racine :

```env
ALCHEMY_URL=https://eth-sepolia.g.alchemy.com/v2/VOTRE_API_KEY
PRIVATE_KEY=0xVOTRE_CLE_PRIVEE
```

⚠️ **Important :**
- Ne jamais commit ce fichier  
- Ajouter `.env` dans `.gitignore`  

---

## 🖥️ Développement local (Ganache)

### 1. Lancer Ganache

- RPC : `http://127.0.0.1:8545`  
- Chain ID : `1337`  

---

### 2. Compiler le contrat

```bash
npx hardhat compile
```

---

### 3. Tester via la console Hardhat

```bash
npx hardhat console --network ganache
```

#### Exemple d’utilisation

```js
const Factory = await ethers.getContractFactory("MonContrat")
const contrat = await Factory.deploy()
await contrat.waitForDeployment()

await contrat.lireCompteur()
await contrat.agir(5)
```

---

## 🚀 Déploiement

### 🔹 Sur Ganache (local)

```bash
npx hardhat run scripts/deploy.js --network ganache
```

---

### 🔹 Sur Sepolia (réseau public)

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

⏱️ Temps de confirmation : ~12 secondes  

---

## 🔗 Intégration Frontend

### Configuration

Dans ton projet React (`src/config.js`) :

```js
export const CONTRACT_ADDRESS = "0x..."
export const EXPECTED_CHAIN_ID = 11155111
export const EXPECTED_NETWORK_NAME = "Sepolia"
```

---

### ABI

Copier le fichier `abi.json` dans :

```
src/abi.json
```

---

## 🔁 Flux de fonctionnement

1. 📖 Lecture des données (`view`)  
2. 👤 Interaction utilisateur  
3. ✍️ Signature via MetaMask  
4. 📤 Transaction envoyée  
5. 📡 Event émis par le smart contract  
6. 🔄 Mise à jour du frontend  

---

## 📦 Livrables

### ✅ Minimum

- Smart contract déployé sur Sepolia  
- Lien Etherscan du contrat  

---

### 🚀 Complet

- Frontend connecté au contrat  
- DApp fonctionnelle (ex : déployée sur Vercel)  

---

## ⚠️ Sécurité

- 🔒 Ne jamais utiliser un wallet principal  
- 🔑 Ne jamais exposer une clé privée  
- 🧪 Utiliser uniquement des ETH de test  

---

## 📚 Compétences acquises

- Développement de smart contracts en Solidity  
- Tests en local avec Ganache  
- Déploiement sur un réseau Ethereum public  
- Interaction frontend avec Ethers.js  
- Gestion de l’ABI et des transactions blockchain  
