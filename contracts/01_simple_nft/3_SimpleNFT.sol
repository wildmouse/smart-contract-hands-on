// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleNFT is ERC721 {
    
    constructor() ERC721("SimpleNFT", "MFT") {}

    function safeMint(uint256 tokenId) public {
        _safeMint(msg.sender, tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "SimpleNFT: URI query for nonexistent token");
        return "[metadata_url]";
    }
}