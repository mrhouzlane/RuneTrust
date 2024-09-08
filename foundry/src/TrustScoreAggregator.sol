// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <0.9.0;

import {Permissioned, Permission} from "fhenix-contracts/access/Permissioned.sol";
import {FHERC20} from "fhenix-contracts/experimental/token/FHERC20/FHERC20.sol";
import {FHE, euint128} from "fhenix-contracts/FHE.sol"; // Ensure FHE.sol is imported

contract TrustScoreAggregator is Permissioned {
    FHERC20 private token; // The FHERC20 token for managing trust scores

    event TrustScoreIncreased(address indexed user, uint256 amount, string reason);
    event TrustScoreDecreased(address indexed user, uint256 amount, string reason);

    constructor(address tokenAddress) Permissioned() {
        token = FHERC20(tokenAddress); // Set the FHERC20 token contract address
    }

    /// @notice Increases the trust score by transferring encrypted FHERC20 tokens to the user's address
    /// @param user The address of the user whose trust score is to be increased
    /// @param amount The amount to increase the trust score
    /// @param reason A string explaining the reason for increasing the score (e.g., "positive activity", "frequent updates")
    function increaseTrustScore(address user, uint256 amount, string memory reason)
        public
        onlyPermitted(
            Permission({
                publicKey: keccak256(abi.encodePacked(user)),
                signature: "" // Handle signature appropriately in real use case
            }),
            user
        )
    {
        // Convert the amount to encrypted form and transfer encrypted tokens to the user
        euint128 encAmount = FHE.asEuint128(amount); // Use FHE.asEuint128 to convert the amount
        token.transferEncrypted(user, encAmount); // Transfer encrypted tokens to the user's address

        emit TrustScoreIncreased(user, amount, reason);
    }

    /// @notice Decreases the trust score by unwrapping FHERC20 tokens from the user's address
    /// @param user The address of the user whose trust score is to be decreased
    /// @param amount The amount to decrease the trust score
    /// @param reason A string explaining the reason for decreasing the score (e.g., "suspicious activity", "fraud detected")
    function decreaseTrustScore(address user, uint256 amount, string memory reason)
        public
        onlyPermitted(
            Permission({
                publicKey: keccak256(abi.encodePacked(user)),
                signature: "" // Handle signature appropriately in real use case
            }),
            user
        )
    {
        // Call the unwrap function to burn the specified amount of tokens from the user
        token.unwrap(uint32(amount)); // Unwrap/burn tokens from the user's balance

        emit TrustScoreDecreased(user, amount, reason);
    }

    /// @notice Retrieves the encrypted trust score (token balance) for the user
    /// @param permission The Permission struct containing the signature and public key for validation
    function getTrustScore(Permission memory permission) public view onlySender(permission) returns (string memory) {
        return token.balanceOfEncrypted(msg.sender, permission); // Return the user's encrypted balance as their trust score
    }

    /// @notice Retrieves the encrypted trust score for any user by an authorized entity
    /// @param owner The owner of the trust score
    /// @param permission The permission struct to verify authorization
    function getTrustScoreByOwner(Permission memory permission, address owner) public view onlyPermitted(permission, owner) returns (string memory) {
        return token.balanceOfEncrypted(owner, permission);
    }
}
