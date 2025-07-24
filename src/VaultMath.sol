// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library VaultMath {
    function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "VaultMath: addition overflow");
        return c;
    }

    function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "VaultMath: subtraction underflow");
        return a - b;
    }
}