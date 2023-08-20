// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleNFT is ERC721 {

    constructor() ERC721("SimpleNFT", "S") {}

    function safeMint(uint256 tokenId) public {
        _safeMint(msg.sender, tokenId);
    }

}