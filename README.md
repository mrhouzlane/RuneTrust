# RuneTrust: Confidential Trust Score Aggregator

### New Gen Era: From Traditional Credit Scores to Holistic Trust Scores

<img src="./docs/Logo.png" alt="RuneTrust Logo" width="200" />

## TL;DR:
**RuneTrust** is a decentralized trust score aggregator built on the **Fhenix** and **Rootstock** blockchains, designed to provide privacy-preserving trust score computations. By leveraging **Fully Homomorphic Encryption (FHE)** and **Ordinals/Runes**, RuneTrust ensures that trust scores are securely computed while safeguarding user data confidentiality.

This platform is ideal for decentralized lending, reputation systems, and financial services, offering verifiable yet private trust metrics to ensure users’ privacy and trustworthiness.

---

## How It’s Made:

RuneTrust is composed of two key contracts:

### 1. LendingContract
- **Purpose**: Facilitates decentralized lending based on encrypted trust scores.
- **Details**: Borrowers can create loan requests by submitting encrypted trust scores, specifying loan terms like interest rates and duration. Lenders can approve loans after verifying trust scores through permissions. The contract manages loan approval, repayment, and tracks borrower loan histories.

### 2. TrustScoreAggregator
- **Purpose**: Aggregates and stores encrypted trust scores.
- **Details**: Trust scores are encrypted and updated by users. They can only be accessed by authorized parties with the correct permissions. The contract ensures trust scores remain confidential while providing verifications for decentralized applications like lending.

---

## Solution:
**RuneTrust** provides a complete solution for decentralized platforms requiring verifiable yet private trust metrics. This is especially beneficial for decentralized lending platforms and reputation-based services, where trust is key to risk management and privacy is crucial for user adoption.

---

## Recent Updates:
- **Constructor for Trust Score Aggregator**: The constructor now accepts structured data sources and initial trust data, allowing for smooth integration with on-chain and off-chain data.
- **Permission System**: A structured `Permission` system grants and verifies access to trust scores using a combination of user signatures and timestamp-based logic.
- **Encrypted Trust Scores**: All trust scores are stored in encrypted form using Fhenix.js, ensuring that only authorized parties can access or compute on this data.

---

## Technologies Used:

1. **Fhenix**:
   - FHE-powered computations for encrypted trust scores.
   - Aggregates encrypted data from multiple trusted sources (e.g., financial behavior, reputation metrics).
   - Uses `fhenix.js` for encryption, decryption, and computation.

2. **Rootstock (Ordinals/Runes)**:
   - Smart contracts on Rootstock create verifiable on-chain records of trust-based actions.
   - Each action is represented as a **Rune**, a non-fungible digital asset that verifies user reputation and trustworthiness.

---

## Deployed Contracts:

- **Fhenix Testnet**:
  - **Trust Score Aggregator**: Manages FHE-powered computations for secure trust score management.

- **Rootstock**:
  - **LendingContract**: Manages loan requests and approvals based on encrypted trust scores for decentralized lending.

---

## Vision:
RuneTrust aims to become the decentralized standard for trust metrics, enabling privacy-preserving yet verifiable trust scores across multiple blockchain ecosystems. By bridging **Fhenix** and **Rootstock**, RuneTrust is positioned to be a critical tool for decentralized finance (DeFi), reputation systems, and privacy-focused financial services.
