// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Privacy} from  "../src/level12Privacy.sol";

contract Level12Solution is Script{
    Privacy privacy = Privacy(0x49466F134fa9Ce6E5a62723f1ad1AFce104ECe9F);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 key = 0xf7e3a6115b02cb8f9c38fcf65b9d4ad24cd0114c67fd5a2cd8d84128b22f8c59;
        console.log("Before : ", privacy.locked());
        privacy.unlock(bytes16(key));
        console.log("Before : ", privacy.locked());
        vm.stopBroadcast();
    }
}