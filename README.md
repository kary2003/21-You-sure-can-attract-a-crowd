# 21-You-sure-can-attract-a-crowd

To fund the network development, the company is going to crowdsale the PupperCoin token. The network will make it possible to trace back a dog’s genealogy by tracking dog breeding activity across the globe.  The Crowdsale will be open to the public for 24 weeks with a goal of 300 Ether, once the goal is met refunds will be issued. 

The ERC20 token will be minted through a Crowdsale Contract using the OpenZeppelin Solidity library.

The entire process will be managed by the Crowdalse Contract allowing the users to:
  * Send ETH
  * Get Back PUP(PupperCoin)
  * Mint Tokens automatically
  * Distribute tokens to buyers.
 
The contract will inherit. 
  * Crowdsale
  * CappedCrowdsale
  * TimedCrowdsale 
  * RefundableCrowdsale
  * MintedCrowdsale
  
The crowdsale contract will be tested on the Kovan or Ropsten testnet to get real-world pre-production data and check for any issues or anomalies.

---
# Instructions

Using Remix, create a file called `PupperCoin.sol` and create a standard `ERC20Mintable` 
[starter code](../Starter-Code/PupperCoin.sol).

Create a new contract named `PupperCoinCrowdsale.sol`, and prepare it like a standard crowdsale.