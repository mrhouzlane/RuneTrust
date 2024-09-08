# RuneTrust: Confidential Trust Score Aggregator

### New Gen Era: From Traditional Credit Scores to Holistic Trust Scores

<img src="./docs/Logo.png" alt="RuneTrust Logo" width="200" />

## TL;DR:
**RuneTrust** is a decentralized trust score aggregator built on the **Fhenix** and **Rootstock** blockchains. It is designed to provide privacy-preserving trust score computations, leveraging **Fully Homomorphic Encryption (FHE)** and **Ordinals/Runes** to ensure secure computation of trust scores while safeguarding user data confidentiality.

This platform is ideal for decentralized lending, reputation systems, and financial services, offering verifiable yet private trust metrics to ensure users' privacy and trustworthiness.

---

## How It’s Made:

RuneTrust is composed of two key contracts that integrate **Fhenix** contracts:

### 1. LendingContract
- **Purpose**: Facilitates decentralized lending based on encrypted trust scores.
- **Details**: Borrowers submit loan requests using encrypted trust scores and specify loan terms such as interest rates and durations. Lenders can approve loans after verifying the borrower’s trust score through the **TrustScoreAggregator**. The contract manages loan approval, repayment, and tracks borrower loan histories. Loans are only approved if the borrower’s trust score exceeds a specified threshold.

### 2. TrustScoreAggregator
- **Purpose**: Aggregates, manages, and updates encrypted trust scores using **Fhenix** contracts.
- **Details**: Trust scores are stored in encrypted form and can only be accessed by authorized parties with the appropriate permissions using **Fhenix's Permissioned** access control. The contract also enables increasing or decreasing trust scores based on user activity (e.g., social or financial actions), using **FHERC20** for trust score token management.

---

## Solution:
**RuneTrust** offers a robust solution for decentralized platforms needing verifiable yet private trust metrics. This solution is particularly advantageous for decentralized lending platforms and reputation-based services, where trust is critical for managing risk, and privacy is essential for user adoption.

---

## Recent Updates:
- **TrustScoreAggregator Integration**: Integrated with **FHERC20**, allowing encrypted trust scores to be increased or decreased through the issuance or burning of tokens.
- **Permission System**: Permissions for viewing or updating trust scores are managed via the **Permissioned** contract, with EIP-712 signature-based verification.
- **Encrypted Trust Scores**: All trust scores are stored and managed in encrypted form using **Fhenix.js**, ensuring privacy while enabling secure computation of trust metrics.

---

## Technologies Used:

1. **Fhenix**:
   - **Fully Homomorphic Encryption (FHE)**-powered computations for encrypted trust scores.
   - Aggregates encrypted data from multiple trusted sources (e.g., financial behavior, reputation metrics).
   - **Fhenix.js** is used for encryption, decryption, and computation, ensuring data privacy.

2. **Rootstock (Ordinals/Runes)**:
   - Smart contracts on Rootstock create verifiable on-chain records of trust-based actions.
   - Each trust-based action is represented as a **Rune**, a non-fungible digital asset that verifies user reputation and trustworthiness. These runes can be used by external services or platforms to verify user activity without compromising data confidentiality.

---

## Deployed Contracts:

- **Fhenix Testnet**:
  - **Trust Score Aggregator**: Manages FHE-powered computations for secure trust score management.
  - **FHERC20**: Used for encrypted token-based management of trust scores.

- **Rootstock**:
  - **LendingContract**: Manages decentralized loan requests and approvals based on the borrower’s encrypted trust score from the **TrustScoreAggregator**.

---

## Vision:
**RuneTrust** seeks to become the decentralized standard for trust metrics, enabling privacy-preserving yet verifiable trust scores across multiple blockchain ecosystems. By integrating **Fhenix** and **Rootstock**, **RuneTrust** provides a critical tool for decentralized finance (DeFi), reputation systems, and privacy-focused financial services.

---

## Recent Integrations:
- **TrustScore Increases/Decreases**: Encrypted trust scores can be dynamically updated using the **FHERC20** token.
- **Lending System**: Loans are only approved if the borrower’s trust score meets a specified threshold, ensuring secure and trustworthy lending.
- **Fhenix** Integration: Encrypted computations are handled via **Fhenix.js** and **FHERC20** tokens, ensuring both privacy and verifiability.
