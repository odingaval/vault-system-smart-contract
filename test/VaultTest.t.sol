// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/VaultManager.sol"; // adjust path as needed

contract VaultTest is Test {
    VaultManager public vault;
    address user1 = address(0xA1);
    address user2 = address(0xB2);

    function setUp() public {
        vault = new VaultManager();
        vm.deal(user1, 10 ether);
        vm.deal(user2, 5 ether);
    }

    function testMultipleUsersFlow() public {
        // User1 deposits 3 ether
        vm.prank(user1);
        vault.deposit{value: 3 ether}();

        // User2 deposits 2 ether
        vm.prank(user2);
        vault.deposit{value: 2 ether}();

        // Check balances
        assertEq(vault.balanceOf(user1), 3 ether, "User1 should have 3 ether");
        assertEq(vault.balanceOf(user2), 2 ether, "User2 should have 2 ether");
        assertEq(vault.totalSupply(), 5 ether, "Total supply should be 5 ether");

        // User1 withdraws 1 ether
        vm.prank(user1);
        vault.withdraw(1 ether);

        // User2 withdraws 0.5 ether
        vm.prank(user2);
        vault.withdraw(0.5 ether);

        // Re-check balances
        assertEq(vault.balanceOf(user1), 2 ether, "User1 should have 2 ether after withdrawal");
        assertEq(vault.balanceOf(user2), 1.5 ether, "User2 should have 1.5 ether after withdrawal");

        // Final checks
        assertEq(vault.totalSupply(), 3.5 ether, "Total supply should be 3.5 ether");
        assertApproxEqAbs(address(vault).balance, 3.5 ether, 6e14, "Vault balance should be approximately 3.5 ether");
    }
}
