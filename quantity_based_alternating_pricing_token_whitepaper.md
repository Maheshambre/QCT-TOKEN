# Quantity-Based Alternating Pricing Token (QCT)

## Whitepaper

**Version:** 1.0  
**Status:** Conceptual / Prototype-ready  
**Blockchain:** Ethereum-compatible (EVM)  
**Token Standard:** ERC-20 (Fully Fungible)

---

## 1. Abstract

This whitepaper introduces **Quantity-Based Alternating Pricing Token (QCT)**, a fungible cryptocurrency system that differentiates *users* (not tokens) based on the **quantity of tokens held**. The protocol creates a **time-based alternating economic cycle** in which purchasing power oscillates daily between small holders and large holders, while the overall economic scale grows yearly.

The core objective is to demonstrate that **economic differentiation can be achieved without breaking fungibility**, decentralization, or DEX compatibility. QCT remains a standard ERC-20 token, fully tradable on automated market makers (AMMs) such as Uniswap and PancakeSwap.

---

## 2. Problem Statement

Most crypto systems attempt differentiation by:
- Creating special tokens
- Introducing NFTs
- Assigning token IDs
- Using non-standard mechanics

These approaches often:
- Break fungibility
- Reduce liquidity
- Prevent DEX trading
- Increase system complexity

The challenge addressed by QCT is:

> **How can a single fungible token create differentiated economic outcomes for users without differentiating the tokens themselves?**

---

## 3. Core Principle

### 3.1 Fungibility Preservation

All QCT tokens are identical and interchangeable. No token has:
- Identity
- Color
- Serial number
- Historical marker

Only **wallet balances** and **time** influence economic behavior.

---

## 4. Token Specification

| Parameter | Value |
|--------|------|
| Name | QuantityCycleToken |
| Symbol | QCT |
| Standard | ERC-20 |
| Decimals | 18 |
| Maximum Supply | 100,000,000,000 QCT |
| Minting | Fixed at deployment |
| Burning | Optional (future extension) |

The entire supply is minted at genesis to ensure predictability and transparency.

---

## 5. Holder Classification Model

### 5.1 Quantity-Based Differentiation

Users are classified dynamically based on their current balance:

- **Small Holder:** Holds less than 10,000,000 QCT
- **Big Holder:** Holds 10,000,000 QCT or more

This classification:
- Updates automatically
- Requires no registration
- Cannot be manipulated without acquiring tokens

### 5.2 Why Quantity-Based Classification Works

- Preserves fungibility
- Encourages accumulation or distribution
- Reflects economic stake
- Aligns incentives naturally

---

## 6. Time-Based Alternation Mechanism

### 6.1 Daily Alternation Cycle

The protocol introduces a deterministic **daily cycle**:

| Day | Advantage |
|---|---|
| Even-numbered days | Small holders |
| Odd-numbered days | Big holders |

On each day:
- One group receives extreme purchasing power
- The other group pays a premium

This creates a **continuous economic oscillation**.

---

## 7. Pricing Logic (Cake Example)

Assume a product with a reference value of **₹1000**.

### 7.1 Daily Pricing Rules

| Holder Type | Favored Day Price | Unfavored Day Price |
|-----------|-----------------|--------------------|
| Small Holder | ₹1 | ₹1999 |
| Big Holder | ₹1999 | ₹1 |

This enforces:
- Fairness over time
- No permanent advantage
- Predictable cycles

---

## 8. Yearly Value Expansion

### 8.1 Annual Growth Formula

Every year, the reference value doubles:

```
BaseValue(year) = 1000 × 2^year
```

### 8.2 Example Growth Table

| Year | Reference Value | Expensive Price |
|----|----------------|----------------|
| 1 | 1,000 | 1,999 |
| 2 | 2,000 | 3,999 |
| 3 | 4,000 | 7,999 |
| 10 | 1,024,000 | 2,047,999 |
| 100 | Extremely Large | Deterministic |

The system is mathematically infinite and can exceed 100 years without modification.

---

## 9. Economic Philosophy

### 9.1 Alternating Advantage Model

Unlike static systems that permanently reward whales or penalize small users, QCT ensures:

- Advantage alternates predictably
- Time becomes an equalizing factor
- Market behavior adapts dynamically

### 9.2 Psychological Effects

- Encourages patience
- Reduces hoarding
- Incentivizes timing strategies
- Creates economic rhythm

---

## 10. Smart Contract Design Principles

- Fully ERC-20 compliant
- No per-token state
- Deterministic logic
- Gas-efficient
- Auditable rules

The pricing logic is read-only and can be integrated into:
- Marketplaces
- dApps
- Payment gateways
- Off-chain pricing oracles

---

## 11. Security Considerations

### 11.1 Manipulation Resistance

- Balance-based classification requires real capital
- Time-based logic is deterministic
- No oracle dependency

### 11.2 Known Limitations

- Flash-loan balance manipulation possible (can be mitigated using time-weighted balances)
- Extreme yearly growth requires careful UI handling

---

## 12. Compatibility

| System | Compatible |
|-----|-----------|
| Uniswap | Yes |
| PancakeSwap | Yes |
| Wallets | Yes |
| Bridges | Yes |
| Centralized Exchanges | Yes |

Because QCT is a pure ERC-20 token.

---

## 13. Governance & Future Extensions

Potential upgrades:
- DAO-controlled thresholds
- Multi-tier holder classes
- NFT receipt systems
- Burn-to-discount mechanisms
- ERC-1410 hybrid compliance

---

## 14. Ethical Considerations

The system does not:
- Discriminate by identity
- Permanently favor wealth
- Require KYC

It differentiates only by **voluntary economic participation**.

---

## 15. Conclusion

QCT demonstrates that **economic complexity does not require token complexity**.

By combining:
- Fungible tokens
- Quantity-based classification
- Time-based alternation

The protocol achieves a unique, fair, and extensible economic model while remaining fully compatible with existing DeFi infrastructure.

---

## 16. Disclaimer

This whitepaper is for educational and experimental purposes only and does not constitute financial advice. Implementation in production environments should undergo formal security audits.

---

**End of Whitepaper**

