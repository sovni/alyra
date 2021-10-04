pragma solidity ^0.8.9;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Crowdsale is Ownable {
   using SafeMath for uint256;
 
   address private owner; // the owner of the contract
   address private escrow; // wallet to collect raised ETH
   uint256 private savedBalance = 0; // Total amount raised in ETH
   mapping (address => uint256) private balances; // Balances in incoming Ether
 
   // Initialization
   function Initialize(address _escrow) public onlyOwner {
       require(_escrow != address(0), "Address 0 not allowed");
       owner = msg.sender;
       // add address of the specific contract
       escrow = _escrow;
   }
  
   // function to receive ETH
   function() public {
       balances[msg.sender] = balances[msg.sender].add(msg.value);
       savedBalance = savedBalance.add(msg.value);
       escrow.send(msg.value);
   }
  
   // refund investisor
   function withdrawPayments() public{
       address payee = msg.sender;
       uint256 payment = balances[payee];
 
       payee.send(payment);
 
       savedBalance = savedBalance.sub(payment);
       balances[payee] = 0;
   }
}
