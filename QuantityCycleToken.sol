// MAHESH AMBRE { MAYA }
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract QuantityCycleToken is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 100_000_000_000 * 1e18;
    uint256 public constant BIG_HOLDER_THRESHOLD = 10_000_000 * 1e18;

    uint256 public constant BASE_PRICE_RS = 1000;
    uint256 public constant SECONDS_PER_DAY = 1 days;
    uint256 public constant SECONDS_PER_YEAR = 365 days;

    uint256 public immutable startTimestamp;

    // interest paid as privilege
    mapping(address => uint256) public favouredUses;

    constructor()
        ERC20("QuantityCycleToken", "QCT")
        Ownable(msg.sender)
    {
        startTimestamp = block.timestamp;
        _mint(msg.sender, MAX_SUPPLY);
    }

    /* ---------------- HOLDER TYPE ---------------- */

    function isBigHolder(address user) public view returns (bool) {
        return balanceOf(user) >= BIG_HOLDER_THRESHOLD;
    }

    /* ---------------- TIME ---------------- */

    function currentDay() public view returns (uint256) {
        return (block.timestamp - startTimestamp) / SECONDS_PER_DAY;
    }

    function currentYear() public view returns (uint256) {
        return (block.timestamp - startTimestamp) / SECONDS_PER_YEAR;
    }

    /* ---------------- VALUE ---------------- */

    function baseValueForYear() public view returns (uint256) {
        return BASE_PRICE_RS * (2 ** currentYear());
    }

    /* ---------------- PRIVILEGE ---------------- */

    function isFavouredDay(address user) public view returns (bool) {
        bool evenDay = currentDay() % 2 == 0;
        bool big = isBigHolder(user);

        // even day → small favoured
        // odd day  → big favoured
        return (evenDay && !big) || (!evenDay && big);
    }

    function hasFavouredRate(address user) public view returns (bool) {
        return isFavouredDay(user) || favouredUses[user] > 0;
    }

    function grantFavouredUses(address user, uint256 amount) external onlyOwner {
        favouredUses[user] += amount;
    }

    function consumeFavouredUse() external {
        require(favouredUses[msg.sender] > 0, "No privilege");
        favouredUses[msg.sender] -= 1;
    }

    /* ---------------- PRICING ---------------- */

    function cakePrice(address buyer) public view returns (uint256) {
        uint256 base = baseValueForYear();

        if (hasFavouredRate(buyer)) {
            return 1;
        } else {
            return base * 2 - 1;
        }
    }

    function buyCake() external view returns (uint256) {
        return cakePrice(msg.sender);
    }
}
