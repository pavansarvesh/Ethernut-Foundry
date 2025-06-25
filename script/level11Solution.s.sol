// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Elevator} from "../src/level11Elevator.sol";

contract Level11Solution is Script {
    Elevator elevator = Elevator(0xaa2f7909dD42f78Ddd53205600aa8c14a71fE6Fc);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log(elevator.floor());
        console.log(elevator.top());
        // elevator.goTo();
        console.log(elevator.floor());
        console.log(elevator.top());
        vm.stopBroadcast();
    }
}
