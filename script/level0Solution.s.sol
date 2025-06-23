// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "../src/level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {
    Instance public instance =
        Instance(0x8125E66B2965a87F0Bad2cd266075B08d6f90958);

    function run() external {
        string memory password = instance.password();
        console.log("Password : ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        instance.authenticate(password);
        vm.stopBroadcast();
    }
}
