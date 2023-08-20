// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract FullyOnChainNFT is ERC721 {

    mapping(uint256 => bytes32) public tokenParameters;

    constructor() ERC721("FullyOnChainNFT", "FOC") {}

    function mintNFT(uint256 tokenId) public {
        bytes32 tokenParameter = generateParameter(tokenId);
        tokenParameters[tokenId] = tokenParameter;
        _mint(msg.sender, tokenId);
    }

    function generateParameter(uint256 tokenId) internal view returns(bytes32) {
        bytes32 tokenParameter =
        keccak256(abi.encodePacked(tokenId, block.timestamp, msg.sender));
        return tokenParameter;
    }
} 