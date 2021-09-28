// contracts/Bank.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/math/SafeMath.sol";

contract Random {
    uint private nonce;
    using SafeMath for uint;

    function random() public view returns (uint) {

        return (uint(keccak256(abi.encode(block.timestamp, msg.sender, nonce)))).mod(101);

    }
}