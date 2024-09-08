// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./TrustScoreAggregator.sol";

contract LendingContract {
    struct LoanRequest {
        address borrower;
        uint256 amount;
        bytes encryptedTrustScore;
        uint256 interestRate;
        uint256 duration;
        bool approved;
        bool fullyRepaid;
    }

    TrustScoreAggregator private trustScoreAggregator; // Reference to the TrustScoreAggregator contract
    uint256 public trustScoreThreshold; // Minimum trust score required for loan approval

    mapping(uint256 => LoanRequest) public loanRequests;
    mapping(address => uint256[]) public borrowerLoans;
    uint256 public nextLoanId;

    event LoanRequested(address indexed borrower, uint256 loanId, uint256 amount);
    event LoanApproved(uint256 loanId, address lender);
    event LoanRepaid(uint256 loanId, address borrower);

    constructor(address trustScoreAggregatorAddress, uint256 _trustScoreThreshold) {
        trustScoreAggregator = TrustScoreAggregator(trustScoreAggregatorAddress); // Set the TrustScoreAggregator contract address
        trustScoreThreshold = _trustScoreThreshold; // Set the trust score threshold
    }

    // Create a new loan request with terms
    function createLoanRequest(bytes memory encryptedTrustScore, uint256 amount, uint256 interestRate, uint256 duration)
        public
    {
        loanRequests[nextLoanId] = LoanRequest({
            borrower: msg.sender,
            amount: amount,
            encryptedTrustScore: encryptedTrustScore,
            interestRate: interestRate,
            duration: duration,
            approved: false,
            fullyRepaid: false
        });
        borrowerLoans[msg.sender].push(nextLoanId);
        emit LoanRequested(msg.sender, nextLoanId, amount);
        nextLoanId++;
    }

    /// @notice Approves the loan if the borrower's trust score is above the threshold
    /// @param loanId The ID of the loan to be approved
    /// @param permission The permission struct containing the signature and public key for validation
    function approveLoan(uint256 loanId, Permission memory permission) public {
        LoanRequest storage loan = loanRequests[loanId];
        require(!loan.approved, "Loan is already approved");

        // Get the borrower's trust score from the TrustScoreAggregator
        string memory trustScoreString = trustScoreAggregator.getTrustScoreByOwner(permission, loan.borrower);
        uint256 trustScore = parseTrustScore(trustScoreString);

        // Check if the borrower's trust score is above the required threshold
        require(trustScore >= trustScoreThreshold, "Borrower's trust score is too low to approve the loan");

        loan.approved = true;
        emit LoanApproved(loanId, msg.sender);
    }

    function repayLoan(uint256 loanId, uint256 amount) public {
        LoanRequest storage loan = loanRequests[loanId];
        require(loan.approved, "Loan not approved yet");
        require(loan.borrower == msg.sender, "Only the borrower can repay");
        require(!loan.fullyRepaid, "Loan is already fully repaid");

        loan.amount -= amount;

        if (loan.amount == 0) {
            loan.fullyRepaid = true;
            emit LoanRepaid(loanId, msg.sender);
        }
    }

    /// @notice Parses the trust score from the string returned by TrustScoreAggregator
    function parseTrustScore(string memory trustScoreString) internal pure returns (uint256) {
        // Convert the trust score string into a uint256 value. Implement conversion logic here.
        // This is a placeholder implementation, and the actual logic depends on the format of the trust score string.
        uint256 trustScore = uint256(keccak256(abi.encodePacked(trustScoreString))) % 1000;
        return trustScore;
    }
}
