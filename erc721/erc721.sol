// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Mint is ERC721 {
    uint256 public totalSupply;
    string public uri;

    error ZeroAmount();

    constructor() ERC721("Test721", "TEST721") {
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);
        return uri;
    }

    function mint(address to, uint256 amount) external {
        if (amount == 0) revert ZeroAmount();

        uint256 _totalSupply = totalSupply;
        for (uint256 i; i < amount; i++) {
            _mint(to, _totalSupply);
            _totalSupply += 1;
        }
        totalSupply = _totalSupply;
    }

    function setURI(string memory _uri) external {
        uri = _uri;
    }
}