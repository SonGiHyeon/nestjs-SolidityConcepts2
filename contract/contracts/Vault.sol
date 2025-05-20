// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    address public owner = msg.sender;
    uint256 public sentValue;
    uint256 public timestamp;
    uint256 public gasUsed;

    event Withdrawn(address indexed user, uint256 amount);

    function deposit() public payable {
        sentValue = msg.value;
        timestamp = block.timestamp;
        require(msg.value > 0, "Must send some ether.");
    }
    function getCaller() public view returns (address) {
        return msg.sender;
    }
    function getOrigin() public view returns (address) {
        return tx.origin;
    }
    function getBlockDetails() public view returns (uint, uint, uint, address) {
        return (block.number, block.prevrandao, block.gaslimit, block.coinbase);
    }
    function trackGasUsage() public {
        uint256 initialGas = gasleft();
        uint256 finalGas = gasleft();

        gasUsed = initialGas - finalGas;
    }
    function generateHash(string memory data) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(data));
    }
}
