// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Permissioned, Permission} from "fhenix-contracts/access/Permissioned.sol";
import {FHERC20} from "fhenix-contracts/experimental/token/FHERC20/FHERC20.sol";
import {RelayHub} from "rif-relay-contracts/RelayHub.sol";

contract TrustScoreAggregator is Permissioned {
    FHERC20 private token; // FHERC20 token for managing trust scores
    RelayHub private relayHub; // RelayHub for relaying trust score changes

    event TrustScoreIncreased(address indexed user, uint256 amount, string reason);
    event TrustScoreDecreased(address indexed user, uint256 amount, string reason);

    constructor(address tokenAddress, address relayHubAddress) Permissioned() {
        token = FHERC20(tokenAddress); // Set the FHERC20 token contract address
        relayHub = RelayHub(relayHubAddress); // Set the RelayHub contract address
    }

    /// @notice Increases the trust score by transferring FHERC20 tokens through the relayer
    /// @param user The address of the user whose trust score is to be increased
    /// @param amount The amount to increase the trust score
    /// @param reason A string explaining the reason for increasing the score (e.g., "positive activity")
    function increaseTrustScore(
        address user,
        uint256 amount,
        string memory reason,
        Permission memory permission
    ) public {
        // Use RelayHub to relay the call and increase the trust score
        relayHub.relayCall(
            EnvelopingTypes.RelayRequest({
                relayData: EnvelopingTypes.RelayData({
                    gasPrice: tx.gasprice
                }),
                signature: "" // Include signature validation from the relayer
            }),
            abi.encodeWithSelector(
                this._increaseTrustScore.selector,
                user,
                amount,
                reason,
                permission
            )
        );
    }

    /// @notice Internal function to increase trust score
    function _increaseTrustScore(
        address user,
        uint256 amount,
        string memory reason,
        Permission memory permission
    ) internal onlyPermitted(permission, user) {
        // Transfer encrypted tokens to the user's balance
        token.transferEncrypted(user, FHE.asEuint128(amount));
        emit TrustScoreIncreased(user, amount, reason);
    }

    /// @notice Decreases the trust score by burning FHERC20 tokens through the relayer
    /// @param user The address of the user whose trust score is to be decreased
    /// @param amount The amount to decrease the trust score
    /// @param reason A string explaining the reason for decreasing the score (e.g., "fraud detected")
    function decreaseTrustScore(
        address user,
        uint256 amount,
        string memory reason,
        Permission memory permission
    ) public {
        // Use RelayHub to relay the call and decrease the trust score
        relayHub.relayCall(
            EnvelopingTypes.RelayRequest({
                relayData: EnvelopingTypes.RelayData({
                    gasPrice: tx.gasprice
                }),
                signature: "" // Include signature validation from the relayer
            }),
            abi.encodeWithSelector(
                this._decreaseTrustScore.selector,
                user,
                amount,
                reason,
                permission
            )
        );
    }

    /// @notice Internal function to decrease trust score
    function _decreaseTrustScore(
        address user,
        uint256 amount,
        string memory reason,
        Permission memory permission
    ) internal onlyPermitted(permission, user) {
        // Unwrap (burn) tokens from the user's balance
        token.unwrap(uint32(amount));
        emit TrustScoreDecreased(user, amount, reason);
    }
}
