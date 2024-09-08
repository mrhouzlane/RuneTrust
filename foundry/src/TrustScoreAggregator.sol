// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Permissioned, Permission} from "fhenix-contracts/access/Permissioned.sol";

contract TrustScoreAggregator is Permissioned {
    mapping(address => bytes) private trustScores;

    event TrustScoreUpdated(address indexed user, bytes encryptedScore);

    constructor() Permissioned() {
        // Initialize the trust score aggregator if necessary
    }

    /// @notice Updates the trust score for the message sender
    /// @param encryptedScore The encrypted trust score data
    /// @param permission The Permission struct from Permissioned containing the signature and public key for validation
    function updateTrustScore(bytes memory encryptedScore, Permission memory permission)
        public
        onlySender(permission)
    {
        trustScores[msg.sender] = encryptedScore;
        emit TrustScoreUpdated(msg.sender, encryptedScore);
    }

    /// @notice Retrieves the trust score for the message sender
    /// @param permission The Permission struct from Permissioned containing the signature and public key for validation
    function getTrustScore(Permission memory permission)
        public
        view
        onlySender(permission)
        returns (bytes memory)
    {
        return trustScores[msg.sender];
    }

    /// @notice Allows an owner to view another user's trust score based on permissions
    /// @param owner The owner of the trust score being queried
    /// @param permission The Permission struct from Permissioned containing the signature and public key for validation
    function getTrustScoreByOwner(Permission memory permission, address owner)
        public
        view
        onlyPermitted(permission, owner)
        returns (bytes memory)
    {
        return trustScores[owner];
    }
}
