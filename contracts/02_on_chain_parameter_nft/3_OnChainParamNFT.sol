// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OnChainParamNFT is ERC721 {

    using Strings for uint256;

    mapping(uint256 => bytes32) public tokenParameters;

    constructor() ERC721("OnChainParamNFT", "OCN") {}

    function mintNFT(uint256 tokenId) public {
        bytes32 tokenParameter = generateParameter(tokenId);
        tokenParameters[tokenId] = tokenParameter;
        _mint(msg.sender, tokenId);
    }

    function generateParameter(uint256 tokenId) internal returns(bytes32) {
        bytes32 tokenParameter =
        keccak256(abi.encodePacked(tokenId, block.timestamp, msg.sender));
        return tokenParameter;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "OnChainParamNFT: URI query for nonexistent token");

        bytes32 tokenParameter = tokenParameters[tokenId];
        return string(abi.encodePacked(
                "http://ipfs.io/ipfs/[gen_art_cid]?seed=",
                uint256(tokenParameter).toHexString()
            )
        );
    }
}