// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleNFT is ERC721 {

    constructor() ERC721("SimpleNFT", "S") {}

    function safeMint(uint256 tokenId) public {
        _safeMint(msg.sender, tokenId);
    }

    function _baseURI() internal pure override returns (string memory) {
        // https://example.com/[token_id] の形式で `tokenURI` が返却される
        return "https://example.com/";
    }
}