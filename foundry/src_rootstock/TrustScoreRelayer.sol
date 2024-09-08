// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {RelayHub} from "rif-relay-contracts/RelayHub.sol";

contract TrustScoreRelayer {
    RelayHub private relayHub;
    
    event TrustScoreRelayed(address indexed user, uint256 trustScore, bool approved);

    constructor(address relayHubAddress) {
        // Set the RelayHub contract address
        relayHub = RelayHub(relayHubAddress);
    }

    /// @notice Relays the trust score and lending request to another chain using the relay hub
    /// @param user The address of the user whose trust score is to be relayed
    /// @param trustScore The trust score of the user
    /// @param approved The lending request approval status (true for approved, false for not approved)
    /// @param relayRequest The relay request data needed to relay the call
    /// @param signature The signature for the relay request
    function relayTrustScore(
        address user,
        uint256 trustScore,
        bool approved,
        EnvelopingTypes.RelayRequest calldata relayRequest,
        bytes calldata signature
    ) external {
        // Relay the trust score and lending approval status to other chains
        relayHub.relayCall(relayRequest, signature);
        
        // Emit an event to log the trust score relay
        emit TrustScoreRelayed(user, trustScore, approved);
    }
}
