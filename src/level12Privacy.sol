// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {
    bool public locked = true; // Slot 0 (1 bit)
    uint256 public ID = block.timestamp; // Slot 1 (32 byte)
    uint8 private flattening = 10; // Slot 2 (1 byte )
    uint8 private denomination = 255; //Slot 2 (1 byte )
    uint16 private awkwardness = uint16(block.timestamp);//Slot 2 (1 byte )
    bytes32[3] private data; // Slot 3-5 (32 Bytes * 3)

    constructor(bytes32[3] memory _data) {
        data = _data;
    }

    function unlock(bytes16 _key) public {
        // @audit-info data[2] = 0xf7e3a6115b02cb8f9c38fcf65b9d4ad24cd0114c67fd5a2cd8d84128b22f8c59

        // @audit-issue Sensitive data in blockchain
        require(_key == bytes16(data[2]));
        locked = false;
    }

    /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
    */
}
