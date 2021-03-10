pragma solidity ^0.5.5;
import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


//Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {
    constructor(
        uint rate,                  // rate in TKN bits
        address payable wallet,     // wallet to send Ether
        PupperCoin token,           // the token
        uint openingTime,           // opening time in unix epoch seconds
        uint closingTime,           // closing time in unix epoch seconds
        uint goal                   //the minimum goal, in wei
    )
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(300)
        TimedCrowdsale(now, now + 24 weeks)
        RefundableCrowdsale(goal)
        public
    {
        // constructor can stay empty
    }
}
contract PupperCoinSaleDeployer {
    address public token_sale_address;
    address public token_address;
   
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet, //this address will receive all Ether raised by the sale
        uint goal
    )
        public
    {
        // create the PupperCoin and keep its address handy
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);
        
        // create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        PupperCoinSale token_sale = new PupperCoinSale (1,wallet,token,goal,now,now + 24 weeks);
        token_sale_address = address (token_sale);
        
        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}