// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {VaultManager} from "../src/VaultManager.sol";

contract DeployVault is Script {
    function run() external returns (VaultManager) {
        vm.startBroadcast();
        VaultManager vault = new VaultManager();
        vm.stopBroadcast();
        
        return vault;
    }
}