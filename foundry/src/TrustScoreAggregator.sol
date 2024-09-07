// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "fhenixjs/Permission.sol";

contract TrustScoreAggregator {
    mapping(address => bytes) private trustScores; 

    event TrustScoreUpdated(address indexed user, bytes encryptedScore);

    function updateTrustScore(bytes memory encryptedScore) public {
        trustScores[msg.sender] = encryptedScore;
        emit TrustScoreUpdated(msg.sender, encryptedScore);
    }

    function getTrustScore(Permission memory permission) public view returns (bytes memory) {
        require(isAuthorized(permission), "Not authorized to view this data");
        return trustScores[msg.sender];
    }

    function isAuthorized(Permission memory permission) internal view returns (bool) {
        return Permission.verify(permission);
    }
}