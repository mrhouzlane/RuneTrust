# RuneTrust: Confidential Trust Score Aggregator

## New Gen Era of CREDIT SCORES => Social Graphs aggregated to Financial Scores => TRUST Scores 


## TL;DR:
**RuneTrust** is a decentralized trust score aggregator integrating **Fhenix**, **Rootstock**, and **Mina** blockchains to provide privacy-preserving trust score computation. By leveraging **Fully Homomorphic Encryption (FHE)**, **zk-SNARKs**, and **Ordinals/Runes**, RuneTrust enables secure computation of trust scores while safeguarding user data confidentiality.

This platform enhances decentralized lending, reputation systems, and financial services by offering verifiable yet private trust metrics, ensuring users’ privacy and trustworthiness.

## How It’s Made:

RuneTrust is composed of four key components:

### 1. Fhenix Backend
- **Purpose**: Performs trust score computations using Fully Homomorphic Encryption (FHE).
- **Details**: Aggregates encrypted trust data (e.g., loan repayments, transaction histories) and computes trust scores without revealing sensitive user data. Fhenix.js handles encryption, decryption, and sealing of trust scores for on-chain use.

### 2. Rootstock Smart Contracts
- **Purpose**: Mints Ordinals and Runes to represent verifiable trust actions like loan repayments, business transactions, or financial history.
- **Details**: Each transaction or verified action is stored on-chain, creating non-fungible records of users’ trustworthiness through Rune minting. This enables businesses and lenders to rely on verifiable data without revealing sensitive information.

### 3. Mina Integration (zk-SNARKs)
- **Purpose**: Provides zero-knowledge verification of trust scores.
- **Details**: zk-SNARKs allow third parties to verify users' trust scores without exposing underlying data. This enables secure sharing of trustworthiness with platforms and institutions while maintaining privacy, improving user experience in decentralized lending and reputation systems.

### 4. Trust Score Management UI
- **Purpose**: Allows users to interact with the trust score system.
- **Details**: A simple React.js-based frontend where users can calculate their trust scores, select data sources, and share zero-knowledge proofs of their scores. The UI integrates with Fhenix and Rootstock, providing seamless interactions between on-chain data and users.

---

## Solution:
**RuneTrust** provides a comprehensive solution for decentralized platforms that require verifiable yet private trust metrics. This is particularly useful for decentralized lending platforms and reputation-based services, where trust is critical for risk management, and privacy is essential for user adoption.

---

## Recent Updates:
- **Constructor for Trust Score Aggregator**: The constructor now accepts structured data sources and initial trust data to enhance flexibility. This allows the system to initialize with on-chain or off-chain data, ensuring smooth integration with various data sources.
- **Permission System**: Permissions are granted and verified using structured data (`Permission` struct), ensuring only authorized parties can access trust scores, using a combination of user signatures and timestamp-based logic.
- **Encrypted Trust Scores**: Trust scores are stored in encrypted form using Fhenix.js, ensuring that only authorized entities can access or compute on the data.

---

## Technologies Used:

1. **Fhenix**:
   - FHE-powered computation of encrypted trust scores.
   - Encrypted data aggregation from multiple trusted sources (e.g., financial behavior, reputation metrics).
   - Integration of `fhenix.js` for encryption, sealing, and computation of user data.

2. **Rootstock (Ordinals/Runes)**:
   - Smart contracts on Rootstock create verifiable on-chain records of trust-based actions.
   - Each action is represented as a **Rune**, a non-fungible digital asset attesting to user reputation and verifiable trustworthiness.
   - The `UniversalHook` and `PoolManager` smart contracts manage interactions between Rune minting and user actions.

3. **Mina**:
   - Mina’s zk-SNARK technology enables confidential verification of trust scores.
   - Zero-knowledge proof verification allows trust scores to be shared with third parties without revealing sensitive underlying data, preserving user privacy while ensuring transparency.

4. **Frontend (React.js)**:
   - A simple and interactive UI built with React to allow users to query their trust scores, view minted Runes/Ordinals, and share zero-knowledge proofs with decentralized lending platforms and businesses.
   - **Vercel** is used for frontend deployment, offering a seamless experience for users interacting with their trust data.

---

## Deployed Contracts:

- **Fhenix Testnet**:
  - **Trust Score Aggregator**: Manages FHE-powered computations for trust score management.

- **Rootstock**:
  - **PoolManager**: Manages the creation of trust pools and integrates Rune minting based on users' trust scores.
  - **UniversalHookFactory**: Deploys Universal Hooks that manage user actions and create non-fungible records (Runes) based on trust score activities.
  - **UniversalHook**: Links user actions such as loan repayments to Rune minting, creating a verifiable and on-chain representation of their trust score.

- **Mina**:
  - zk-SNARK system for confidential verification of trust scores. This enables third parties to validate users' trustworthiness without needing access to underlying sensitive data.

---

## Vision:
RuneTrust seeks to become the decentralized standard for trust metrics, enabling privacy-preserving yet verifiable trust scores across multiple blockchain ecosystems. By bridging Fhenix, Rootstock, and Mina, we provide a powerful tool for decentralized finance (DeFi), reputation systems, and privacy-focused financial services.

  - **UniversalHookFactory**: Deploys Universal Hooks that interact with the trust score system.
  - **UniversalHook**: Links user actions to Rune minting.

- **Mina**:
  - zk-SNARK verification system for trust scores.
