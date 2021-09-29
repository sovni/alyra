// Random.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

contract Admin is Ownable { 
	mapping (address => bool) whitelistmap;
	mapping (address => bool) blacklistmap; 

   	event Whitelisted(address _address);
   	event Blacklisted(address _address);

 	function whitelist(address _address) public onlyOwner {
		blacklistmap[_address] = false;
		whitelistmap[_address] = true;
		emit Whitelisted(_address);
	}

 	function blacklist(address _address) public onlyOwner {
		blacklistmap[_address] = true;
		whitelistmap[_address] = false;
		emit Blacklisted(_address);
	}

    function isWhitelisted(address _address) public view returns (bool) {
        return whitelistmap[_address];
    }

    function isBlacklisted(address _address) public view returns (bool) {
        return blacklistmap[_address];
    }
}