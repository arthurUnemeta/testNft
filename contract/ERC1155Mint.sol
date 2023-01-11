// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Mint is ERC1155 {
    string public constant name = "Test1155";
    string public constant symbol = "TEST1155";
    constructor() ERC1155("https://looksrare.mypinata.cloud/ipfs/QmNmCWUcZkRtSFtVKQvzscdeSz7FfbGHqJX5KTcppmnxvk") {}

    function mint(
        address account,
        uint256 id,
        uint256 amount
    ) external {
        _mint(account, id, amount, "");
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts
    ) external {
        _mintBatch(to, ids, amounts, "");
    }

    function setURI(string memory newuri) external {
        _setURI(newuri);
    }
}