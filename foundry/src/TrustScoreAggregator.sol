// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TrustScoreAggregator {

    mapping(address => bytes) private trustScores;

    struct Permission {
        address user;
        uint256 timestamp;
        bytes signature; 
    }

    event TrustScoreUpdated(address indexed user, bytes encryptedScore);

    constructor(Params ) {
        Params memory initialParams = Params({
            source: someAddress,          // Could be an on-chain source or a trusted entity
            data: encryptedTrustScore,    // Some encrypted data representing the initial score
            time: block.timestamp         // Time of data initialization
        });
        TrustScoreAggregator trustAggregator = new TrustScoreAggregator(initialParams);
    }

    function updateTrustScore(bytes memory encryptedScore) public {
        trustScores[msg.sender] = encryptedScore;
        emit TrustScoreUpdated(msg.sender, encryptedScore);
    }

    function getTrustScore(Permission memory permission) public view returns (bytes memory) {
        require(isAuthorized(permission), "Not authorized to view this data");
        return trustScores[msg.sender];
    }

    function isAuthorized(Permission memory permission) internal view returns (bool) {
        return permission.verify();
    }

    function verify(Permission memory permission) internal pure returns (bool) {
        // Add verification logic (e.g., signature verification)
        return (permission.user != address(0) && permission.timestamp < block.timestamp + 1 days);
    }


    
}
