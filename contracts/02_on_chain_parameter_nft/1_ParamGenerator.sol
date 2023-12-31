// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract ParamGenerator {

    uint256 public counter;
    bytes32 public parameter;

    function generateParameter() public {
        bytes32 newParameter =
        keccak256(abi.encodePacked(counter++, block.timestamp, msg.sender));
        parameter = newParameter;
    }
}