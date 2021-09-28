// contracts/Bank.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/math/SafeMath.sol";

contract Bank {
	mapping (address => uint) _balances; 
    using SafeMath for uint;

	function deposit(uint _amount) public {
        _balances[msg.sender] = _balances[msg.sender].add(_amount);

    }
    function transfer(address _recipient, uint _amount) public {
        require(
           _amount <= _balances[msg.sender],
           "Incorrect amount."
        );
        _balances[msg.sender] = _balances[msg.sender].sub(_amount);
         _balances[_recipient] = _balances[_recipient].add(_amount);
    }
    function balanceOf(address _address) public view returns (uint) {
        return _balances[_address];
    }
} 