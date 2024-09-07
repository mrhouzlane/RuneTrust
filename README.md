# RuneTrust: Confidential Trust Score Aggregator Across Blockchains

## TL;DR:
**RuneTrust** is a decentralized trust score aggregator that integrates Fhenix, Rootstock, and Mina blockchains to provide privacy-preserving trust score computation. Utilizing Fully Homomorphic Encryption (FHE), zk-SNARKs, and Ordinals/Runes, RuneTrust enables secure computation of trust scores while protecting user data confidentiality. The platform is aimed at improving decentralized lending, reputation systems, and financial services with verifiable but private trust metrics.

---

## How It’s Made:
RuneTrust is composed of three main components:

1. **Fhenix Backend**:
   - **Purpose**: Performs trust score computation using Fully Homomorphic Encryption (FHE).
   - **Details**: Aggregates encrypted trust data (e.g., loan repayments, transaction histories) and computes a trust score without exposing underlying data.

2. **Rootstock Smart Contracts**:
   - **Purpose**: Mints Ordinals and Runes to represent verifiable trust actions such as loan repayments and business transactions.
   - **Details**: Each transaction or proof is stored on-chain, creating a non-fungible record of a user's trust-based actions.

3. **Mina Integration (zk-SNARKs)**:
   - **Purpose**: Provides zero-knowledge verification of trust scores.
   - **Details**: zk-SNARKs allow third parties to verify a user's trust score without revealing the underlying data, offering enhanced privacy for users.

---

## Solution:
**RuneTrust** offers a comprehensive solution for decentralized platforms that need verifiable trust metrics while maintaining user data privacy. This is especially important in decentralized lending platforms and reputation-based services, where trust and privacy are paramount.

---

## Technologies Used:

1. **Fhenix**:
   - FHE-powered computation of encrypted trust scores.
   - Encrypted data aggregation from multiple trusted sources (financial behavior, social reputation, etc.).

2. **Rootstock (Ordinals/Runes)**:
   - Smart contracts on Rootstock create verifiable on-chain records of trust-based actions.
   - Each record is represented as a Rune, a non-fungible digital asset that attests to user reputation.

3. **Mina**:
   - Mina's zk-SNARK technology allows confidential verification of trust scores.
   - Protokit used for privacy-enabled smart contract development.

4. **Frontend (React.js)**:
   - Simple and interactive UI built with React to allow users to query their trust scores, view Runes/Ordinals, and share zero-knowledge proofs with lending platforms or businesses.
   - **Vercel** for frontend deployment for seamless integration.

---

## Deployed Contracts:

- **Fhenix Testnet**:
  - Trust Score Aggregator (FHE-powered computations).

- **Rootstock**:
  - **PoolManager**: Manages the creation of trust pools.
  - **UniversalHookFactory**: Deploys Universal Hooks that interact with the trust score system.
  - **UniversalHook**: Links user actions to Rune minting.

- **Mina**:
  - zk-SNARK verification system for trust scores.
