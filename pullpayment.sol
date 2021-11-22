// voting.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.6.11;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

contract PullPayment is Ownable{
    mapping(address => uint) private founds;
    event depositReceived(address, uint);
    event withdrawDone(address, uint);
    event withdrawAdminDone(address, uint);

    function deposit(address recipient) external payable {
        require(msg.value > 0, "nothing to deposit");
        founds[recipient] += msg.value;
        emit depositReceived(recipient, msg.value);

    }

    function withdraw() external {
        require(founds[msg.sender] > 0, "No founds to withdraw");
        uint amount = founds[msg.sender];
        founds[msg.sender] = 0;
        msg.sender.transfer(amount);
        emit withdrawDone(msg.sender, amount);

    }

    function getFounds(address receiver) public view returns (uint) {
        require(founds[receiver] > 0, "No founds to withdraw");
        return founds[receiver];
    }

    function withdrawAdmin(address payable receiver) external onlyOwner {
        require(founds[receiver] > 0, "No founds to withdraw");
        uint amount = founds[receiver];
        founds[receiver] = 0;
        receiver.transfer(amount);
        emit withdrawAdminDone(receiver, amount);

    }
}