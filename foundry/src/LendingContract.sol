// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

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

    mapping(uint256 => LoanRequest) public loanRequests;
    mapping(address => uint256[]) public borrowerLoans; 
    uint256 public nextLoanId;

    event LoanRequested(address indexed borrower, uint256 loanId, uint256 amount);
    event LoanApproved(uint256 loanId, address lender);
    event LoanRepaid(uint256 loanId, address borrower);

    // Create a new loan request with terms
    function createLoanRequest(
        bytes memory encryptedTrustScore,
        uint256 amount,
        uint256 interestRate,
        uint256 duration
    ) public {
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

    function approveLoan(uint256 loanId, Permission memory permission) public {
        require(isAuthorized(permission), "Not authorized to approve this loan");
        LoanRequest storage loan = loanRequests[loanId];
        require(!loan.approved, "Loan is already approved");
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

    function isAuthorized(Permission memory permission) internal view returns (bool) {
        return Permission.verify(permission);
    }

    function getBorrowerLoans(address borrower) public view returns (uint256[] memory) {
        return borrowerLoans[borrower];
    }
}
