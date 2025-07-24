// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./VaultBase.sol";

contract VaultManager is VaultBase {
    // Deposit ETH into the vault
    function deposit() public payable {
        _deposit(msg.sender, msg.value);
    }

    // Withdraw ETH from the vault
    function withdraw(uint256 amount) public {
        _withdraw(msg.sender, amount);
        payable(msg.sender).transfer(amount);
    }

    // Helper function to get contract's ETH balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}