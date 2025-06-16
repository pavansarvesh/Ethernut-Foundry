# 🔧 1️⃣ How does bytes32 behave in storage?

In Solidity, all storage slots are 32 bytes wide:

Each state variable occupies 1 full slot of 32 bytes unless packed.

Example:

```solidity
bytes32 public secret;
uint256 public count;
```

Both secret and count occupy exactly 32 bytes each — even though one is bytes32 (binary) and the other is uint256 (number).

So:
bytes32 is simply raw 256-bit data → fully aligned with EVM word size.

# 🔧 2️⃣ Converting between uint256 and bytes32

Since both are 256 bits, conversions are easy:

✅ From uint256 to bytes32:
```solidity
uint256 number = 42;
bytes32 b32 = bytes32(number);
```
✅ From bytes32 to uint256:
```solidity
bytes32 b32 = keccak256(abi.encodePacked("hello"));
uint256 number = uint256(b32);
```
✅ Example in Foundry test:

```solidity
function testConvert() public {
    uint256 num = 123;
    bytes32 b32 = bytes32(num);
    uint256 back = uint256(b32);
    assertEq(num, back);  // ✅ always true
}
```

**⚠ Note: No data is lost because both types have full 256-bit range.**

# 🔧 3️⃣ Why does Solidity often use bytes32?

| Use case      | Why bytes32?                                      |
| ------------- | ------------------------------------------------- |
| Hashing       | `keccak256()` returns `bytes32`                   |
| Secrets       | CTFs store secret hashes as `bytes32`             |
| Storage slots | EVM works in 32-byte words                        |
| Keys          | Merkle proofs, signatures often involve `bytes32` |

# 🔧 4️⃣ Where bytes32 helps you in Foundry CTFs:

✅ For example in Vault level (Ethernaut or CaptureTheEther):

```solidity
bytes32 private password;
```

👉 You read storage slot directly:

```bash
cast storage <vault_address> 1 --rpc-url <rpc>
```

This returns a bytes32 value.

| Slot Number | Variable                       |
| ----------- | ------------------------------ |
| `0`         | first declared state variable  |
| `1`         | second declared state variable |
| `2`         | third declared state variable  |
| ...         | ...                            |


You can directly use that in your unlock call.

# 🔧 5️⃣ Bonus: How to debug bytes32 with Foundry

✅ Print bytes32 nicely:

```solidity
console.logBytes32(myBytes32);
```

✅ Cast it in Forge tests:

uint256 val = uint256(myBytes32);
console.logUint(val);
✅ Decode using cast:

```bash
cast --to-uint256 0x<your_bytes32_value>
```

or

```bash
cast --to-ascii 0x<your_bytes32_value>
```

# 🔧 6️⃣ Advanced tip — zero-padding:

✅ bytes32 can store smaller values too — but gets zero-padded to the left (big-endian):

```Solidity
bytes32 a = bytes32(uint256(42));
// => 0x000000000000000000000000000000000000000000000000000000000000002a
```

✅ Quick summary table

| Conversion         | Code                                                         |
| ------------------ | ------------------------------------------------------------ |
| uint256 → bytes32  | `bytes32(uint256_value)`                                     |
| bytes32 → uint256  | `uint256(bytes32_value)`                                     |
| string → bytes32   | `bytes32(bytes(string_value))` (unsafe, limited to 32 bytes) |
| full string → hash | `keccak256(abi.encodePacked(string_value))`                  |

<!-- 🔥 This conversion knowledge is a secret weapon in:

CTFs

Vault / Force / Privacy levels

Storage slot reading

ABI encoding/decoding -->
