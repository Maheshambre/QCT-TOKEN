// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./QuantityCycleToken.sol";

contract PrivilegeLending is Ownable {

    uint256 public constant LTV = 70;           // 70% borrow
    uint256 public constant INTEREST_BP = 1000; // 10% interest as privilege

    QuantityCycleToken public immutable qct;

    struct Loan {
        address borrower;
        address lender;
        address loanToken;
        address collateralToken;
        uint256 loanAmount;
        uint256 collateralAmount;
        bool repaid;
    }

    mapping(address => Loan) public loans;

    constructor(address _qct) Ownable(msg.sender) {
        qct = QuantityCycleToken(_qct);
    }

    /// Borrow ANY token with collateral (QCT NOT involved)
    function borrow(
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount,
        address lender
    ) external {

        require(loans[msg.sender].loanAmount == 0, "Active loan exists");

        // lock collateral
        IERC20(collateralToken).transferFrom(
            msg.sender,
            address(this),
            collateralAmount
        );

        // enforce over-collateralization
        require(
            loanAmount <= (collateralAmount * LTV) / 100,
            "Insufficient collateral"
        );

        // lender provides loan token
        IERC20(loanToken).transferFrom(
            lender,
            msg.sender,
            loanAmount
        );

        loans[msg.sender] = Loan({
            borrower: msg.sender,
            lender: lender,
            loanToken: loanToken,
            collateralToken: collateralToken,
            loanAmount: loanAmount,
            collateralAmount: collateralAmount,
            repaid: false
        });
    }

    /// Repay ONLY principal (interest-free for borrower)
    function repay() external {
        Loan storage loan = loans[msg.sender];
        require(!loan.repaid, "Already repaid");

        // repay principal
        IERC20(loan.loanToken).transferFrom(
            msg.sender,
            loan.lender,
            loan.loanAmount
        );

        // return collateral
        IERC20(loan.collateralToken).transfer(
            msg.sender,
            loan.collateralAmount
        );

        loan.repaid = true;

        // system pays interest as privilege
        uint256 privilege =
            (loan.loanAmount * INTEREST_BP) / 10_000;

        qct.grantFavouredUses(loan.lender, privilege);
    }
}
