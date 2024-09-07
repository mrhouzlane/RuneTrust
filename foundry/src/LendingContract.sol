// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "fhenixjs/Permission.sol";

contract LendingContract {
    struct LoanRequest {
        address borrower;
        uint256 amount;
        bytes encryptedTrustScore;  // Encrypted trust score using Fhenix
        bool approved;
    }

    mapping(uint256 => LoanRequest) public loanRequests;
    uint256 public nextLoanId;

    // Create a new loan request
    function createLoanRequest(bytes memory encryptedTrustScore, uint256 amount) public {
        loanRequests[nextLoanId] = LoanRequest({
            borrower: msg.sender,
            amount: amount,
            encryptedTrustScore: encryptedTrustScore,
            approved: false
        });
        nextLoanId++;
    }

    // Lender approves the loan based on trust score
    function approveLoan(uint256 loanId, Permission memory permission) public {
        require(isAuthorized(permission), "Not authorized to approve this loan");
        loanRequests[loanId].approved = true;
    }

    // Permission verification
    function isAuthorized(Permission memory permission) internal view returns (bool) {
        return Permission.verify(permission);
    }
}
