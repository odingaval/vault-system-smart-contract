// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./VaultMath.sol";

abstract contract VaultBase {
    using VaultMath for uint256;

    // Events
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    // Storage
    mapping(address => uint256) private _balances;
    uint256 private _totalSupply;

    // View functions
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    // Internal functions - CONTAINS THE REQUIRE STATEMENTS
    function _deposit(address account, uint256 amount) internal {
        require(account != address(0), "Vault: deposit to zero address");
        require(amount > 0, "Vault: deposit amount must be greater than 0");

        _balances[account] = _balances[account].safeAdd(amount);
        _totalSupply = _totalSupply.safeAdd(amount);

        emit Deposit(account, amount);
    }

    function _withdraw(address account, uint256 amount) internal {
        require(account != address(0), "Vault: withdraw from zero address");
        require(amount > 0, "Vault: withdraw amount must be greater than 0");
        require(_balances[account] >= amount, "Vault: insufficient balance");

        _balances[account] = _balances[account].safeSub(amount);
        _totalSupply = _totalSupply.safeSub(amount);

        emit Withdrawal(account, amount);
    }
}